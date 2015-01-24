# user = getUserFactory()
# otherUser = getOtherUserFactory()

# Factory.define 'checkin', Checkins, 
#   userId: user._id
#   gender: "male"
#   createdAt: new Date()
#   updatedAt: new Date()
#   geojson:
#     type: "Feature"
#     geometry:
#       type: "Point"
#       coordinates: [42.2814, -83.7483]

# Factory.define 'otherCheckin', Checkins,
#     userId: otherUser._id
#     gender: "female"
#     createdAt: new Date()
#     updatedAt: new Date()
#     geojson:
#       type: "Feature"
#       geometry:
#         type: "Point"
#         coordinates: [42.2815, -83.7484]

# @seedCheckins = () ->
#   Factory.create('checkin')
#   Factory.create('otherCheckin')
#   if Checkins.find().count() < 2 then console.log 'Error: Checkins factory failed to generate checkins'