# #Login also includes opening the website in the browser
# UserStatus.events.on "connectionLogin", (fields) ->
#   console.log 'THIS SHOULD TRIGGER WHEN THE USER LOGS IN'
#   location = Geolocation.latLng()
#   console.log location.lat, location.lng

# UserStatus.events.on "connectionIdle", (fields) ->

# UserStatus.events.on "connectionActive", (fields) ->
#   console.log 'THIS SHOULD TRIGGER WHEN THE CONNECTION IS ACTIVE'
#   location = Geolocation.latLng()
#   console.log location.lat, location.lng

# # 'Logging out' also includes closing the browser
# UserStatus.events.on "connectionLogout", (fields) ->



Tracker.autorun () ->
  lastLocation = Geolocation.currentLocation()
  locationErrors = Geolocation.error()
  Session.set 'lastKnownLocation', lastLocation
  console.log "Location: " + Session.get('lastKnownLocation')
  Session.set 'locationErrors', locationErrors
  console.log "Location Errors: " + Session.get('locationErrors')