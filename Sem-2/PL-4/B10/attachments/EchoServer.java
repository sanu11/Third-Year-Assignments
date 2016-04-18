import java.net.*;
import java.io.*;

public class EchoServer implements Runnable
{
	public Socket threadSocket;
	public static void main(String[] args) {
		
		ServerSocket s;
		try {
			s = new ServerSocket(25000);
			while(true)
			{
				Socket server = s.accept();
				EchoServer newThread = new EchoServer(server);
				
				(new Thread(newThread)).start();
				
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public EchoServer(Socket server)
	{
		this.threadSocket = server;
	}

	@Override
	public void run() {
		System.out.println("Connected to "+threadSocket.getRemoteSocketAddress());
		
		try {
			DataInputStream in = new DataInputStream(threadSocket.getInputStream());
			
			long threadId = Thread.currentThread().getId();
			String def = "Thread id "+threadId+": ";
			
			String ss = in.readUTF();
			System.out.println(def+ss);
			
			DataOutputStream out = new DataOutputStream(threadSocket.getOutputStream()); 
			
			out.writeUTF("Thanks for connecting....");
			out.writeUTF("You want to quit? (y/n) or else type your message:");
			String yn = "n";
			while(true)
			{
				
				yn = in.readUTF();
				System.out.println(def+yn);
				if(yn.equals("y") || yn.equals("Y"))
					break;
				out.writeUTF("Echo: "+yn+"\n"+"You want to quit? (y/n) or else type your message:");
			}
			
			System.out.println("Thread with id "+ threadId + " closed.");
			threadSocket.close();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}

