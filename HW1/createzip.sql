connect to sample;
CREATE TABLE cse532.ZIPPOP(
ZIP integer UNIQUE NOT NULL,
COUNTY integer,
GEOID integer,
ZPOP integer
)
COMPRESS YES;