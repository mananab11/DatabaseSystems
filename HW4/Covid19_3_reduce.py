#! /usr/bin/env python
import sys
#location(tab)normalizedvalues(tab)   as string in different lines
def main():
	total_norm=0.0
	current_country=None
	location=None
	for line in sys.stdin:
		location,casesNorm=line.split('\t',1)
		try:
			casesNorm=float(casesNorm)
		except ValueError:
			continue
		if location == current_country:
			total_norm+=casesNorm
		else:
			if current_country:
				cases_per_million=total_norm*1000000
				print '%s\t%s' % (current_country,cases_per_million)
			total_norm=casesNorm
			current_country=location
			
	if current_country==location:
		cases_per_million=total_norm*1000000
		print '%s\t%s' % (current_country,cases_per_million)
	sys.stdout.flush()

if __name__ == '__main__':
	main()
