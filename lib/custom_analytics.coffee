# analytics.load("helloWorld")
analytics.load(Meteor.settings.public.services.segmentio.apiKey)

@EventTracker = {}

EventTracker.trackEvent = (name, properties) ->
  _attemptToIdentifyUser()
  analytics.track name, properties

EventTracker.trackLoginOrSignup = () ->
  _attemptToIdentifyUser()
  
  properties = {}
  properties.service = 'Facebook'
  
  analytics.track 'Login', properties

EventTracker.trackSignup = () ->
  _attemptToIdentifyUser()
  
  properties = {}
  properties.service = 'Facebook'

  analytics.track 'Signup', properties

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
  
  analytics.identify user._id,
    gender: gender
    # lastLocation
