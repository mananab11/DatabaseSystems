drop index cse532.facilityidx;
drop index cse532.zipidx;
drop index cse532.uszipGeoidx;
drop index cse532.facilitycertidx;
drop index cse532.facilityaddidx;

create index cse532.facilityidx on cse532.facility(geolocation) extend using db2gse.spatial_index(0.85, 2, 5);

create index cse532.zipidx on cse532.uszip(shape) extend using db2gse.spatial_index(0.85, 2, 5);

create index cse532.uszipGeoidx on cse532.uszip(GEOID10);

create index cse532.facilitycertidx on cse532.facilitycertification(ATTRIBUTEVALUE,FACILITYID);

create index cse532.facilityaddidx on cse532.facility(FACILITYID,ZIPCODE);


runstats on table cse532.facility and indexes all;

runstats on table cse532.facilitycertification and indexes all;

runstats on table cse532.uszip and indexes all;