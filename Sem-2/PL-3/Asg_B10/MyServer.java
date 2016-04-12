import java.io.*;
import java.net.*;


class MyClass extends Thread{

		private Socket c;
		private DataInputStream din;
		private DataOutputStream dout;
		
	public MyClass(Socket c)
	{

		try{

		this.c=c;
		din = new DataInputStream(c.getInputStream());
		dout = new DataOutputStream(c.getOutputStream());
		}

		catch(IOException e)
		{
			System.out.println(e);
		}


	}

	public void run(){
			String str="";
			while(!str.equals("stop"))
			{

			try{
				str = din.readUTF();
				int portno = c.getPort();
				System.out.println("client port no is :"+portno);
				dout.writeUTF("msg from server"+str);				
			   }
				
			catch(IOException ee)
			{
				System.out.println(ee);
			}


			}

		
		}








}


public class MyServer
{
	private static ServerSocket ss=null;
	private static Socket client=null;

	public static void main(String args[])
	{

		try{
		ss = new ServerSocket(5555);
		while(true)
		{
			client = ss.accept();
			Thread t = new MyClass(client);
			t.start();
		
		}
		}
		catch(IOException eee)
		{
			System.out.println(eee);
		}


	}






}


































