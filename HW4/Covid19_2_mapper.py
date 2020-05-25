#! /usr/bin/env python
import sys
# import datetime
st_dt=sys.argv[1]
end_dt=sys.argv[2]


startdate=st_dt.strip()
enddate=end_dt.strip()

def main():
	for line in sys.stdin:
		lst=line.split(",")
		date,location,new_deaths=lst[0],lst[1],lst[3]
		date_str=date.strip()
		if date_str<= enddate and date_str>=startdate:
			sys.stdout.write("\t".join((location,str(new_deaths),"\n")))
	sys.stdout.flush()
if __name__ == '__main__':
	if "2019-12-31"<= startdate<= "2020-04-08" and "2019-12-31"<= enddate<= "2020-04-08" and startdate<enddate:
		main()


