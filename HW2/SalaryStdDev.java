import java.sql.*;
import static java.lang.Math.sqrt;

public class SalaryStdDev {

    public static  String databasename;
    public static  String tablename;
    public static  String userid;
    public static  String pwd;
    public  static String url;//="jdbc:db2://127.0.0.1:50000/SAMPLE";
    public static  String Database ="SAMPLE";
    public static Connection connection;
    public static Statement stmt;
    public static ResultSet rs;
    private  static double new_mean=0.0;
    private  static double prev_mean=0.0;
    private  static double new_variance=0.0;
    private  static double prev_variance=0.0;
    private  static double sdev=0.0;


    public static void main(String[] args) {

          int  count=0;
	  databasename=args[0];
          tablename=args[1];
          userid=args[2];
          pwd=args[3];
	  url="jdbc:db2://127.0.0.1:50000/"+databasename;
        try
        {
            Class.forName("com.ibm.db2.jcc.DB2Driver");
            DriverManager.registerDriver(new com.ibm.db2.jcc.DB2Driver());
            connection= DriverManager.getConnection(url,userid,pwd);
            connection.setAutoCommit(false);
            stmt = connection.createStatement();
            rs = stmt.executeQuery("SELECT Salary FROM "+tablename);
            while (rs.next()) {
                double salary = Double.parseDouble(rs.getString(1));
                count++;
                SalaryStdDev.ComputeSD(salary,count);
            }
            System.out.println("Standard deviation: "+sdev);
        }
        catch (ClassNotFoundException e)
        {
	   e.printStackTrace();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }
    private static void ComputeSD(double salary,int count)
    {
        new_mean=prev_mean+((salary-prev_mean)/count);
        new_variance=prev_variance+((salary-prev_mean)*(salary-new_mean));
        sdev=sqrt(new_variance/count);
        prev_mean=new_mean;
        prev_variance=new_variance;
    }
}
