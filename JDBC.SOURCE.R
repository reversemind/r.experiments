
Sys.setenv(JAVA_HOME='/usr/java/jdk1.7.0_67')
options(java.parameters="-Xmx2g")
library(rJava)

# Output Java version
.jinit()
print(.jcall("java/lang/System", "S", "getProperty", "java.version"))