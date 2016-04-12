import java.io.*;
import java.net.*;


public class MyClient{


	public static void main(String args[])
	{

		try{
		Socket s = new Socket("localhost",5555);		
		DataInputStream din = new DataInputStream(s.getInputStream());
		DataOutputStream dout = new DataOutputStream(s.getOutputStream());
		
		String str = "";
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		while(true)
		{
			str = br.readLine();
			dout.writeUTF(str);
			dout.flush();
			String tmp = din.readUTF();
			System.out.println(tmp);


		}
			}catch(IOException e)
			{
				System.out.println(e);
		
			}

	}





}







































