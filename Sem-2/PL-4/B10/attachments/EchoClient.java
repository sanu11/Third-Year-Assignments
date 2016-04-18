import java.io.*;
import java.net.*;
import java.util.Scanner;
public class EchoClient {

	public static void main(String[] args) {
		String serverName = "192.168.4.30";
	      int port = 25000;
	      try
	      {
	         Socket client = new Socket(serverName, port);
	         
	         System.out.println("Just connected to " + client.getRemoteSocketAddress());

	         OutputStream outToServer = client.getOutputStream();
	         DataOutputStream out = new DataOutputStream(outToServer);
	         out.writeUTF("I am new client");
	         
	         InputStream inFromServer = client.getInputStream();
	         DataInputStream in = new DataInputStream(inFromServer);
	         System.out.println("Server says:\n" + in.readUTF());
	         
	         String yn = "n";
	         Scanner read = new Scanner(System.in);
	         while(true)
	         {
	        	 System.out.println(in.readUTF());
	        	 yn = read.next();
	        	 out.writeUTF(yn);
	        	 if(yn.equals("y") || yn.equals("Y"))
	        		 break;
	         }
	         read.close();
	         client.close();
	      }
	      catch(IOException e){
	         e.printStackTrace();
	      }

	}

}
