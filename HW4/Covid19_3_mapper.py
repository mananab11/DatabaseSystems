#! /usr/bin/env python
import sys

popdict=dict()

def readCache():
	for line in open('popcache'):
		if "Bonaire" in line:
			continue
		lst=line.split(',')
		location,population=lst[1],lst[4]
		location=location.strip()
		try:
			popdict[location]=population
		except KeyError:
			continue
#do more work in map to reduce communication cost of sending population to reducers
def main():
	for line in sys.stdin:
		lst=line.split(",")
		location,new_cases=lst[1],lst[2]
		location=location.strip()
		try:
			population_str=popdict[location]
			population=float(population_str) #takes care of empty population
			new_cases=float(new_cases)
		except KeyError:
			continue
		except ValueError:
			continue
		if population>0:
			normalizedValue=new_cases/population #case divide by country pop
		sys.stdout.write("\t".join((location,str(normalizedValue),"\n")))			
	sys.stdout.flush()
if __name__ == '__main__':
	readCache()
	main()

