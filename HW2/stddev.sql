CREATE PROCEDURE Compute_Sdev
(out s_dev DECFLOAT)
LANGUAGE SQL 
BEGIN 
DECLARE prev_mean FLOAT DEFAULT 0;
DECLARE new_mean FLOAT DEFAULT 0;
DECLARE prev_variance FLOAT DEFAULT 0;
DECLARE new_variance FLOAT DEFAULT 0;
DECLARE sal FLOAT DEFAULT 0;
DECLARE sdev DECFLOAT DEFAULT 0;
DECLARE counts integer DEFAULT 0;
FOR v AS c CURSOR for SELECT SALARY FROM EMPLOYEE
DO 
 SET sal=v.SALARY;
 SET counts=counts+1;
 SET new_mean=prev_mean+((sal-prev_mean)/counts);
 SET new_variance=prev_variance+((sal-prev_mean)*(sal-new_mean));
 SET sdev=sqrt(new_variance/counts);
 SET prev_mean=new_mean;
 SET prev_variance=new_variance;
END FOR;
SET s_dev=sdev;
END
@
CALL Compute_Sdev(?)@
