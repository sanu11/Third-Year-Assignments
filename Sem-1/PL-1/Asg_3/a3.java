import java.sql.*;
public class a3 {
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	   static final String DB_URL = "jdbc:mysql://192.168.5.101:3306/te3265db";
	   //  Database credentials
	   static final String USER = "te3265";
	   static final String PASS = "te3265";
	   
	   public static void main(String[] args) {
	   Connection conn = null;
	   Statement stmt = null;
	   try{
	      //STEP 2: Register JDBC driver
	      Class.forName("com.mysql.jdbc.Driver");

	      //STEP 3: Open a connection
	      System.out.println("Connecting to database...");
	      conn = DriverManager.getConnection(DB_URL,USER,PASS);

	      //STEP 4: Execute a query
	      System.out.println("Creating statement...");
	      System.out.println("Simple View\n");
	      stmt = conn.createStatement();
	      String sql;
	      sql = "CREATE view v15 as select prof_id,prof_name,designation,salary from Professors";
	      stmt.executeUpdate(sql);
	      sql="SELECT * from v15";
	      ResultSet rs = stmt.executeQuery(sql);

	      //STEP 5: Extract data from result set
	      while(rs.next()){
	         //Retrieve by column name
	         int id  = rs.getInt("prof_id");
	         String name=rs.getString("prof_name");
	         String desi=rs.getString("designation");
	         int sal=rs.getInt("salary");
	         //Display values
	         System.out.print("prof_id " + id +" Name: "+name+" Desg.: "+desi+" Salary: "+sal+"\n");
	        
	      }
	      System.out.println("Complex View\n");
	      sql = "CREATE view v16 as select p.prof_id,p.prof_name,p.dept_id,d.dept_name from Professors p,Departments d order by dept_id";
	      stmt.executeUpdate(sql);
	      sql="SELECT * from v16";
	      rs = stmt.executeQuery(sql);
	      
	      while(rs.next()){
		         //Retrieve by column name
		         int id  = rs.getInt("prof_id");
		         String name=rs.getString("prof_name");
		         String dep=rs.getString("dept_name");
		         int dept=rs.getInt("dept_id");
		         //Display values
		         System.out.print("prof_id " + id +" Name: "+name+" Department: "+dep+" Department id: "+dept+"\n");
		        
		      }
	      System.out.println("Index on email \n");
	      sql="CREATE index i13 on Professors(email)";
	      stmt.executeUpdate(sql);
	      sql="SHOW index from Professors";
	      rs = stmt.executeQuery(sql);

	      while(rs.next()){
		         System.out.println(rs.getString(1)+" "+rs.getString(2)+" "+rs.getString(3)+" "+rs.getString(4)+" "+rs.getString(5)+" "+rs.getString(6));
		        
		      }
	      
	      //STEP 6: Clean-up environment
	      rs.close();
	      stmt.close();
	      conn.close();
	   }catch(SQLException se){
	      //Handle errors for JDBC
	      se.printStackTrace();
	   }catch(Exception e){
	      //Handle errors for Class.forName
	      e.printStackTrace();
	   }finally{
	      //finally block used to close resources
	      try{
	         if(stmt!=null)
	            stmt.close();
	      }catch(SQLException se2){
	      }// nothing we can do
	      try{
	         if(conn!=null)
	            conn.close();
	      }catch(SQLException se){
	         se.printStackTrace();
	      }//end finally try
	   }//end try
	   System.out.println("Goodbye!");
	}//end main	

}
