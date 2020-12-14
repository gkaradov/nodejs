# nodejs  


## /awserver  contains the server part of the project.  It is working

end points available are :

/
/help
/getall
/gisquery/:x/:y/:distance
/logdata/:userid/:logdata

### /getall   
Gets all locations in the databse

### /gisquery/:x/:y/:distance
Returns the location with distance greater than the provided parameter.  The x,y coordinates must be in Lat long
x range: -180 to 180  radians
y range: -90 to 90 radians
distance:  distance in meters
test call; http://localhost:8080/gisquery/-79.74017030232889/43.77898984966451/30    

### /logdata/:userid/:logdata
inserts log entry in a json format - can be any json
test call:   http://localhost:8080/logdata/43.5/%7B%22name%22:%22mark%22,%22age%22:43%7D
