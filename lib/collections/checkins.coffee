# This is basically just a way of storing the USer's location in a persistent way.
@Checkins = new Mongo.Collection('checkins')
Checkins.attachSchema(Schema.Checkin) # Validate the Story against our schema

@validateCheckin = (checkinAttributes) ->
  errors = {}
  # redFlag - this should actually validate the object and add errors
  # Figure out how to validate this against the SimpleSchema

Meteor.methods.checkinInsert = (checkinAttributes) ->
  userId = Meteor.userId() # Only the user can edit edit their checkin data
  # It must have a latitude and longitude
  check checkinAttributes, 
    latitude: Number
    longitude: Number

  # Make sure that user only has one.
  checkinForSameUser = Checkins.findOne({userId: userId})
  if checkinForSameUser
    return checkinExists: true, _id: checkinForSameUser._id 

  # Build the checkin object
  checkin = checkinAttributes
  checkin.userId = userId
  checkin.updatedAt = new Date()
  checkin.createdAt = new Date()

  checkin.geojson =
    type: "Feature"
    geometry:
      type: "Point"
      coordinates: [latitude, longitude]

  # Validate the checkin object
  errors = validateCheckin(checkin)
  if errors
    throw new Meteor.Error('invalid-checkin', "You must set a latitude and longitude")
    
  checkinId = Checkins.insert(checkin)
    
  return {_id: checkinId}

Meteor.methods.checkinUpdateUserLatAndLng = (checkinAttributes) ->
  userId = Meteor.userId()
  check(checkinAttributes.latitude, Number)
  check(checkinAttributes.longitude, Number)

  checkinForSameUser = Checkins.findOne({userId: userId})
  
  if checkinForSameUser
    checkinUpdates = {}
    checkinUpdates.geojson.coordinates.latitude = checkinAttributes.latitude
    checkinUpdates.geojson.coordinates.longitude = checkinAttributes.longitude
    checkinUpdates.updatedAt = new Date()

    # redFlag - there should be some sort of error catching here...

    checkinId = Checkins.update({_id: checkinForSameUser}, checkin)
    return {_id: checkinId}

  else
    Meteor.call 'checkinInsert', checkinAttributes, (err, checkinId) ->
      if err
        throwError err.reason
      else
        return checkinId







    