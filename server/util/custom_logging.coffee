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
    Meteor.log.error("Error: " + params.text, params.obj)
    return true
  logInfo: (params) ->
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
