# JAVA_HOME
Sys.setenv(JAVA_HOME='/usr/java/default')
options(java.parameters="-Xmx2g")
library(rJava)


# Output Java version
.jinit()
print(.jcall("java/lang/System", "S", "getProperty", "java.version"))


# Load RJDBC library
library(RJDBC)