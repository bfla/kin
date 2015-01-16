
# I couldn't find a good library to do this, so I just hacked something together.  Hopefully it works on mobile devices...

# @Geolocation = {}

# watchingPosition = false
# # location = new ReactiveVar(null)
# # error = new ReactiveVar(null)
# location = {}
# error = {}

# options =
#   enableHighAccuracy: true
#   maximumAge: 0

# onPosition = (newLocation) ->
#   location.set(newLocation)
#   error.set(null)

# startWatchingPosition = () ->
#   if !watchingPosition and navigator.geolocation
#     navigator.geolocation.watchPosition(onPosition, onError, options)
#     watchingPosition = true

# @Geolocation.error = () ->
#   startWatchingPosition()
#   return error.get()

# @Geolocation.currentLocation = () ->
#     startWatchingPosition()
#     return location.get()

# @Geolocation.latLng = () ->
#     loc = @Geolocation.currentLocation()

#     if (loc)
#       return {lat: loc.coords.latitude, lng: loc.coords.longitude}
#     else
#       return null