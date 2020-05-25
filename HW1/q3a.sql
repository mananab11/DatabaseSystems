connect to sample;
WITH
MonthlyGrouping(years_grouped,month_grouped,total_dosage) AS 
(
SELECT YEAR(TRANSACTION_DATE),MONTH(TRANSACTION_DATE ),sum(DOSAGE_UNIT) FROM CSE532.DEA_NY GROUP BY YEAR(TRANSACTION_DATE),MONTH(TRANSACTION_DATE )
),
Smooth(YEAR_Month,Monthly_Count,Smooth_Count) AS 
(
SELECT years_grouped||
CASE 
    WHEN (  CAST( month_grouped AS INT)  < 10 ) 
         THEN '0'  || CAST( month_grouped AS INT)
    ELSE CAST (month_grouped AS CHAR(2))
END,
total_dosage,AVG(total_dosage) OVER (ORDER BY years_grouped ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS Smooth_Count FROM MonthlyGrouping
)
SELECT YEAR_Month,Monthly_Count,Smooth_Count
FROM Smooth;