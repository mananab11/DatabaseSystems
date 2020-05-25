#! /usr/bin/env python
import sys
import datetime
flag=sys.argv[1]
if flag=='true':
	count_world_flag=True
else :
	count_world_flag=False

year_to_exclude="2019"
limit_dt='2020-04-08'
limit_date=datetime.datetime.strptime(limit_dt,"%Y-%m-%d")

def main():
	for line in sys.stdin:
		lst=line.split(",")
		date,location,new_cases=lst[0],lst[1],lst[2]
		date_str=date.strip()
		try:
			curr_dt=datetime.datetime.strptime(date_str,"%Y-%m-%d")
		except:
			continue
		if (year_to_exclude in date):
				continue
		if count_world_flag is False:
			#ignore world,international rows
			if 'World' in location or 'International' in location:
				continue
			else:
				sys.stdout.write("\t".join((location,str(new_cases),"\n"))) #location,cases as string in different lines
		else:
			#include world ,international
			sys.stdout.write("\t".join((location,str(new_cases),"\n")))
	sys.stdout.flush()
if __name__ == '__main__':
	main()

