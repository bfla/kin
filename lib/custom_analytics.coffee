# analytics.load("helloWorld")
analytics.load(Meteor.settings.public.services.segmentio.apiKey)

@EventTracker = {}

EventTracker.trackEvent = (name, properties) ->
  _attemptToIdentifyUser()
  analytics.track name, properties

EventTracker.trackLoginOrSignup = () ->
  _attemptToIdentifyUser()
  analytics.track 'Login', {service: 'Facebook'}

EventTracker.trackSignup = () ->
  _attemptToIdentifyUser()
  analytics.track 'Signup', {service: 'Facebook'}

EventTracker.trackLogout = () ->
  _attemptToIdentifyUser()
  analytics.track 'Logout'

_attemptToIdentifyUser = () ->
  user = Meteor.user()
  if !user
    return

  if Meteor.isClient
      userData = Meteor.subscribe 'userData', user._id
      console.log 'userData: ' + JSON.stringify(userData)
      gender = userData.services.facebook.gender
      console.log "GENDER: " + gender
  else
    gender = user.services.facebook.gender



# # Track Pageviews
# Router.onRun ()->
#   analytics.page()

# Track the user's identity
# Meteor.startup ()->
#   Tracker.autorun (c) ->
#     # waiting for user subscription to load
#     # unless Router.current() || Router.current().ready()
#     #   return
#     user = Meteor.user()
#     if !user
#       return

#     if Meteor.isClient
#       userData = Meteor.subscribe 'userData', user._id
#       console.log 'userData: ' + JSON.stringify(userData)
#       gender = userData.services.facebook.gender
#       console.log "GENDER: " + gender
#     else
#       gender = user.services.facebook.gender

#     analytics.identify user._id,
#       gender: user.profile.gender
#       # lastLocation: user.profile.lastLocation
#       email: user.emails[0].address

#     c.stop()
