# Add field to see if user has the mobile app

# @storeGeolocation = () ->
#   position = Geolocation.currentLocation() #returns a position object with coords with [lat, lng], a timestamp, possibly more
#   console.log 'THIS IS THE POSITION' + position
#   Meteor.users.update({userId: user._id}, {lastPosition: position})

# redFlag - I have no idea if this is secure or not.
# Fix it later. Haha.

  # lastLocation = Meteor.user().lastLocation #Returns geojson
