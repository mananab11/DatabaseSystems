connect to sample;
CREATE TABLE cse532.dea_ny(
REPORTER_DEA_NO varchar(20),
REPORTER_BUS_ACT varchar(20),
REPORTER_NAME varchar(20),
REPORTER_ADDL_CO_INFO varchar(20),
REPORTER_ADDRESS1 varchar(20),
REPORTER_ADDRESS2 varchar(20),
REPORTER_CITY varchar(20),
REPORTER_STATE varchar(20),
REPORTER_ZIP varchar(15),
REPORTER_COUNTY varchar(20),
BUYER_DEA_NO varchar(20),
BUYER_BUS_ACT varchar(20),
BUYER_NAME varchar(20),
BUYER_ADDL_CO_INFO varchar(20),
BUYER_ADDRESS1 varchar(20),
BUYER_ADDRESS2 varchar(20),
BUYER_CITY varchar(20),
BUYER_STATE varchar(20),
BUYER_ZIP varchar(10),
BUYER_COUNTY varchar(20),
TRANSACTION_CODE char(2),
DRUG_CODE  integer,
NDC_NO	varchar(20),
DRUG_NAME varchar(20),
QUANTITY REAL,
UNIT varchar(15),
ACTION_INDICATOR char(2),
ORDER_FORM_NO  varchar(20),
CORRECTION_NO varchar(20),
STRENGTH varchar(20),
TRANSACTION_DATE DATE,
CALC_BASE_WT_IN_GM REAL,
DOSAGE_UNIT REAL,
TRANSACTION_ID varchar(20),
Product_Name  varchar(20),
Ingredient_Name varchar(20),
Measure varchar(20),
MME_Conversion_Factor REAL,
Combined_Labeler_Name varchar(20),
Reporter_family varchar(20),
dos_str varchar(20),
MME varchar(20)
)
COMPRESS YES;