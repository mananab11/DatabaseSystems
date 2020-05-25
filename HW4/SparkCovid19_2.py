import sys

#from pyspark.sql import SparkSession
from pyspark import SparkContext

def typecast(rows,cache):
    try:	
       return [rows[0],float(rows[1])/float(cache.value[rows[0]])]
    except ValueError:
       pass
    except KeyError:
       pass
    #except ZeroDivisionError:
    #   pass
if __name__ == "__main__":
    sc=SparkContext('local[*]',"wordcount")
    poprdd=sc.textFile(sys.argv[2])#popfile
    cache=poprdd.map(lambda line:line.split(','))\
    .map(lambda row:[row[1],row[4]])\
    .filter(lambda row:row[0]!='location' and row[1]!='0').collectAsMap()
    broadcache=sc.broadcast(cache)
    lines = sc.textFile(sys.argv[1])#covid file
    output=lines.map(lambda line:line.split(','))\
         .map(lambda row:[row[1],row[2]])\
         .filter(lambda row:row[0]!='location' and 'Bonaire' not in row[0] and row[1]!="")\
         .map(lambda rows:typecast(rows,broadcache))\
         .filter(lambda row:row!=None).reduceByKey(lambda a,b:a+b)\
	 .map(lambda row:(row[0],row[1]*1000000)).sortByKey()
    output.saveAsTextFile(sys.argv[3])
    sc.stop()
