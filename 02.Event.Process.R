######################################
#
#
# Load event data
#
#
load("data/events.dump")
load("data/event_content.dump")

# Object class
print(c("Events - object class:",class(events)))
print(c("Type:",typeof(events)))

# DIM
print(c("DIM:", dim(events)))


# 'Cause it's list
# take the elements by name
# events[[1,"matchId"]] 
# or
matchIds <- events$matchId


# What to see
#http://www.statmethods.net/
