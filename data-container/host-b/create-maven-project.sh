cd
mvn -B archetype:generate \
-DarchetypeGroupId=org.apache.maven.archetypes \
-DarchetypeArtifactId=maven-archetype-quickstart \
-DarchetypeVersion=1.1 \
-DgroupId=com.cmartin.learn \
-DartifactId=javapp-b \
-Dversion=1.0.0
cd javapp-b
mvn dependency:tree
mvn versions:use-latest-versions
mvn clean install
mvn site
