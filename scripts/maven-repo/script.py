import json,sys;

obj=json.load(sys.stdin); 

print "<dependency>";
print "    <groupId>" + obj["response"]["docs"][0]["g"] + "</groupId>";
print "    <artifactId>" + obj["response"]["docs"][0]["a"] + "</artifactId>";
print "    <version>" + obj["response"]["docs"][0]["v"] + "</version>"; 
print "</dependency>";
