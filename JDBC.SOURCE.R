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

# Get all events for 
eventsByMatchId <- dbGetQuery(jdbcConnection, sprintf("SELECT * FROM events WHERE \"matchId\" = '%s' order by minsec;", matchIds[1,1]))



# Get all events
events <- dbGetQuery(jdbcConnection, "SELECT * FROM events order by minsec;")
print(dim(events))

# Get all events_content
event_content <- dbGetQuery(jdbcConnection, "SELECT * FROM event_content;")



# Get names of events
attr(events,"names")



# Dump into serializable files
save(events, file="./events.dump")
save(event_content, file="./event_content.dump")



# Remove from RAM
rm(events)
rm(event_content)



# Load data back
load("./events.dump")
load("./event_content.dump")



# Close connection
dbDisconnect(jdbcConnection)

