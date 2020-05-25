connect to sample;
WITH 
Info AS 
(
SELECT Buyer_Zip AS nydea_zipcode,SUM(MME) AS mme FROM CSE532.DEA_NY GROUP BY BUYER_ZIP 
),
ZIPPER(zip_code,zip_pop) AS
(
SELECT ZIP,ZPOP FROM CSE532.ZIPPOP
),
Merged(zipcode,mme,population) AS 
(
SELECT nydea_zipcode,mme,zip_pop FROM Info LEFT OUTER JOIN ZIPPER ON nydea_zipcode=zip_code
),
Norm(zipcode,mme,population,normalized_mme) AS 
(
SELECT ZIPCODE,mme,population,mme/population FROM Merged WHERE population IS NOT NULL AND population>0 
)
SELECT zipcode,mme,normalized_mme,rank() OVER(ORDER BY normalized_mme DESC) mme_rank FROM Norm FETCH FIRST 5 ROWS ONLY;