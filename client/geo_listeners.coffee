# Track the user's location and take appropriate action when it updates...
Tracker.autorun () ->
  lastLocation = Geolocation.currentLocation()
  locationErrors = Geolocation.error()
  Session.set 'lastKnownLocation', lastLocation
  if lastLocation?.coords?.latitude && lastLocation?.coords?.longitude
    storeUserGeolocation(lastLocation)
  console.log "Location: " + Session.get('lastKnownLocation')
  Session.set 'locationErrors', locationErrors
  console.log "Location Errors: " + Session.get('locationErrors')

# Save the user's location to their checkin object in the database
storeUserGeolocation = (location) ->
  if location?.coords?.latitude && location?.coords?.longitude
    params = {}
    params.latitude = location.coords.latitude
    params.longitude = location.coords.longitude

    Meteor.call 'checkinUpdateUserLatAndLng', params, (err, result) ->
      return throwError(err.reason) if err
  else
    return throwError 'Could not find your location. Check your privacy settings. If this error continues, please contact bfla@umich.edu.'