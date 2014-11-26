################################################
#
#
# Events statistics
#
#

# JAVA_HOME
Sys.setenv(JAVA_HOME='/usr/java/default')
options(java.parameters="-Xmx2g")
library(rJava)


# Output Java version
.jinit()
print(.jcall("java/lang/System", "S", "getProperty", "java.version"))


# Load RJDBC library
library(RJDBC)

jdbcDriver <- JDBC(driverClass="org.postgresql.Driver", classPath="./postgresql-9.1-901-1.jdbc4.jar")
jdbcConnection <- dbConnect(jdbcDriver, "jdbc:postgresql://localhost:5432/events_soccer", "test", "test")


# Query on the Oracle instance name.
instanceName <- dbGetQuery(jdbcConnection, "SELECT * FROM events limit 1;")
print(c("names:",instanceName))

# Get all match id
matchIds <- dbGetQuery(jdbcConnection, "SELECT distinct \"matchId\" FROM events order by \"matchId\" desc;")
print(c("Match ids count:" ,dim(matchIds)))




# Close connection
dbDisconnect(jdbcConnection)




###########################################
#
#  SOURSE
#
###########################################
#
# Sys.setenv(JAVA_HOME='/usr/java/default')
# options(java.parameters="-Xmx2g")
# library(rJava)
# 
# # Output Java version
# .jinit()
# print(.jcall("java/lang/System", "S", "getProperty", "java.version"))
# 
# 
# #d <- .jnew("java/util/Date")
# #.jcall(d,,"setTime",1413662532660)
# 
# 
# 
# # Load RJDBC library
# library(RJDBC)
# 
# # Create connection driver and open connection
# jdbcDriver <- JDBC(driverClass="org.postgresql.Driver", classPath="/opt/postgresql-9.1-901-1.jdbc4.jar")
# jdbcConnection <- dbConnect(jdbcDriver, "jdbc:postgresql://localhost:5432/EKG", "test", "test")
# 
# # Query on the Oracle instance name.
# instanceName <- dbGetQuery(jdbcConnection, "SELECT * FROM r_ekg;")
# print(c("names:",instanceName))
# 
# #dbSendQuery(jdbcConnection, "INSERT INTO r_ekg(id, value) VALUES (1, 1);")
# 
# 
# 
# 
# 
# # Load 450k data
# EKG <- read.csv("/home/admin/Coursera/historical_data_comma.csv")
# 
# 
# # matrix dimension
# print(dim(EKG))
# 
# length(EKG[,1])
# 
# for (i in 1:length(EKG[,1])) {
#   #for (i in 15:35) {  
#   #print(c(i," ",EKG[i,1]))
#   #values <- paste(EKG[i,1], EKG[i,2], sep = ",")
#   values <- paste(i, 1, EKG[i,1], EKG[i,2], sep = ",")
#   result <- paste("INSERT INTO r_ekg(id, patient_id, created_at, value) VALUES (",values,");",sep = "")
#   #print(result)
#   dbSendUpdate(jdbcConnection,paste("INSERT INTO r_ekg(id, patient_id, created_at, value) VALUES (",values,");",sep = ""))
#   
#   if(i %% 1000 == 0){
#     print("!!!!!!!")
#   }
#   
# }
# 
# 
# 
# 
# # Close connection
# dbDisconnect(jdbcConnection)