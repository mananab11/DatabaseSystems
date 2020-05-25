#! /usr/bin/env python

import sys
#location(tab)cases(tab)   as string in different lines
def main():
	country_cases=0
	current_country=None
	location=None
	for line in sys.stdin:
		location,new_cases=line.strip().split('\t',1)
		try:
			count=int(new_cases)
		except ValueError:
			continue
		if location == current_country:
			country_cases+=count
		else:
			if current_country:
				print '%s\t%s' % (current_country,country_cases)
			country_cases=count
			current_country=location
			
	if current_country==location:
		print '%s\t%s' % (current_country,country_cases)
	sys.stdout.flush()

if __name__ == '__main__':
	main()
