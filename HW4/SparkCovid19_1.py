import sys

#from pyspark.sql import SparkSession
from pyspark import SparkContext


if __name__ == "__main__":
    startdate=sys.argv[2]
    enddate=sys.argv[3]
    if "2019-12-31"<= startdate<= "2020-04-08" and "2019-12-31"<= enddate<= "2020-04-08" and startdate<enddate:
		sc=SparkContext('local[*]',"wordcount")
		lines = sc.textFile(sys.argv[1])
		output=lines.flatMap(lambda line :[line.split(',')]) \
		        .filter(lambda tup:tup[0]!='date' and tup[1]!='location' and tup[2]!='new_cases'and tup[3]!='new_deaths' and tup[0]>=startdate and tup[0]<=enddate) \
		        .map(lambda lst:(lst[1],lst[3])) \
		        .reduceByKey(lambda a,b:int(a)+int(b)) \
		        .sortByKey()
		output.saveAsTextFile(sys.argv[4])
		sc.stop()
    else:
	sys.exit(-1)
