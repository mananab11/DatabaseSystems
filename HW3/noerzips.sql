SELECT CURRENT TIMESTAMP FROM SYSIBM.SYSDUMMY1;
WITH zipsWithed(zip) AS 
(
SELECT DISTINCT CAST (f.ZIPCODE AS varchar(5)) FROM CSE532.FACILITY f,cse532.FACILITYCERTIFICATION f2
WHERE f.FACILITYID =f2.FACILITYID AND f2.ATTRIBUTEVALUE ='Emergency Department'
),
ZIPSWITHEDShape(zip,shape) AS 
(
SELECT z.zip,u.SHAPE FROM zipsWithed z,CSE532.USZIP u WHERE z.zip=u.GEOID10
),
zipswithoutED1(zip1) AS 
(
(SELECT CAST (ZIPCODE AS varchar(5)) AS zip1 FROM CSE532.FACILITY) EXCEPT 
(SELECT zip FROM zipsWithed)
),
zipWithoutEdShape(zip,shape) AS 
(
--zips without emergency department
SELECT z.zip1,u.SHAPE FROM zipswithoutED1 AS z ,CSE532.USZIP u WHERE z.zip1 =u.GEOID10
),
zipwithadjoiningER(zip2) AS 
(
--zips with adjoining zips as ER
SELECT c1.zip 
FROM zipWithoutEdShape c1 LEFT JOIN ZIPSWITHEDShape c2 ON c1.zip!=c2.zip 
WHERE db2gse.st_touches(c1.shape,c2.shape)=1
),
deduce(zip) AS 
(
(SELECT zip  FROM zipWithoutEdShape) EXCEPT 
(SELECT zip2 FROM zipwithadjoiningER)
)
SELECT DISTINCT zip FROM deduce;
SELECT CURRENT TIMESTAMP FROM SYSIBM.SYSDUMMY1;