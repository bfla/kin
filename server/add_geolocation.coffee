@storeGeolocation = () ->
  position = Geolocation.currentLocation() #returns a position object with coords with [lat, lng], a timestamp, possibly more
  console.log 'THIS IS THE POSITION' + position
  Meteor.users.update({userId: user._id}, {lastPosition: position})