-- create user temporary tablespace usertemp1 
--     managed by system using ('usertemp1')
-- DROP PROCEDURE MergeZip(DECFLOAT);
CREATE PROCEDURE MergeZip(out pop DECFLOAT)
LANGUAGE SQL 
BEGIN 
DECLARE sum FLOAT DEFAULT 0;
DECLARE counts integer DEFAULT 0;
-- FOR v AS c CURSOR for Select ZPOP from cse532.zippop
-- DO 
--  SET sum=sum+v.ZPOP;
--  SET counts=counts+1;
-- END FOR;
-- SET pop=(sum/counts);
FOR v1 AS c CURSOR for Select Zpop from cse532.zippop
DO 
 SET sum=sum+v1.ZPOP;
 SET counts=counts+1;
END FOR;
SET pop=(sum+sum+1/counts);
DECLARE new_pop FLOAT DEFAULT 0;
DECLARE new_zip integer DEFAULT 0;

FOR v2 AS c CURSOR for Select z1.ZIP,z1.Zpop,z2.Shape from cse532.zippop z1,cse532.USZIP z2 where z1.zip=z2.zip
DO
  BEGIN	 
	IF v2.zpop<pop 
	 THEN  
		FOR v3 AS c CURSOR for Select z2.ZIP,z2.Shape from cse532.USZIP z2
			IF(v2.zip=v3.zip) THEN
				Continue;
			ELSE 
				IF(db2gse.st_intersects(v2.Shape,v3.Shape)=1) THEN
					SET new_pop=v2.Zpop+v3.Zpop --(Select x.Zipop from cse532.zippop x where x.zip=v3.zip);
					IF(new_pop>pop) THEN
						-- Store in temporary table
						-- newpop=new_pop
						--zip=v2.zip
					END FOR;--break from v3 cursor loop	
					ELSE
					 Continue;--Continue v3 to next zip
  -- Select v2.ZIP as zp,v2.Shape as shp from  
		END FOR; 
	END IF;
	END
END FOR;
END
@
CALL MergeZip(?)@
