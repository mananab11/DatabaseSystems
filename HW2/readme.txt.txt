*-------------------q1------------------------------*

Compile java file using javac command and if Class_path not set pass -cp flag as well.

Run class file generated above 
java -cp ".;pathto_directoy\db2jcc4.jar" SalaryStdDev  Sample(Database) Employee(tablename) USER Password

For computing sddev have used a single pass ,overflow resistant streaming algorithm
*---------------------------------------------------*

*-------------------q2-------------------------------*
->use "db2 -td@ -f stddev.sql" to exeute and call store Procedure 


To drop procedure: "db2 drop procedure Compute_Sdev"

*----------------------------------------------------*