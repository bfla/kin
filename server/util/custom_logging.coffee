# myTransportSetup = () ->
#   if this.options.someCoolSetting
#     # Do something cool.

# myTransportLog = (timestamp, level, message, meta) ->
#   if (this.options.meta)
#     # Transport message and meta.
#   else 
#     # Transport without meta.

# # Trail.Instance.transportManager

Meteor.methods
  logError: (params) ->
    # Takes params.errorText and params.errorObj
    if Meteor.user()
      params.obj = _.extend(params.obj, {user: {_id: Meteor.userId() }})
    Meteor.log.error("Error: " + params.text, params.obj)
    return true
  logInfo: (params) ->
    if Meteor.user()
      params.obj = _.extend(params.obj, {user: {_id: Meteor.userId() }})
    Mateor.log.info(params.text, params.obj)
    return true
  logLoginToConsole: () ->
    userId = Meteor.userId()
    Meteor.log.info("User Logged in successfully.", {user: {_id: userId}})
    return true
  logSignupToConsole: () ->
    userId = Meteor.userId()
    Meteor.log.info("User signed up.", {user: {_id: userId}})
    return true
  logFailedSigninAttempt: () ->
    Meteor.log.debug("User attempted to login and failed")
    return true
