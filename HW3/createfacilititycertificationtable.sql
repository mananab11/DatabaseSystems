connect to sample;
CREATE TABLE cse532.facilitycertification(
FacilityID varchar(5),
FacilityName varchar(30),
Description varchar(25),
AttributeType varchar(25),
AttributeValue varchar(25),
MeasureValue integer,
County varchar(25)
)
COMPRESS YES;