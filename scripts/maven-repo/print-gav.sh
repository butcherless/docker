#!/bin/bash


for i in $(find /home/cmartin/.m2/repository/org/springframework/ -name *.jar)
do
  SHA1SUM=`sha1sum $i | awk '{print $1}'`
  echo $SHA1SUM
  echo 'http://search.maven.org/solrsearch/select?q=1:'${SHA1SUM}'&rows=20&wt=json'
  curl -s 'http://search.maven.org/solrsearch/select?q=1:'${SHA1SUM}'&rows=20&wt=json' | python script.py
  echo
  sleep 1
done

#curl -s 'http://search.maven.org/solrsearch/select?q=1:'${i}'&rows=20&wt=json'