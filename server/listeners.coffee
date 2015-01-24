# This uses the UserStatus module
# fields has a userId, lastActivity, and connectionId

#Login also includes opening the website in the browser
# UserStatus.events.on "connectionLogin", (fields) ->
#   console.log 'THIS SHOULD TRIGGER WHEN THE USER LOGS IN'

# UserStatus.events.on "connectionIdle", (fields) ->

# UserStatus.events.on "connectionActive", (fields) ->
#   console.log 'THIS SHOULD TRIGGER WHEN THE CONNECTION IS ACTIVE'

# # 'Logging out' also includes closing the browser
# UserStatus.events.on "connectionLogout", (fields) ->
# Accounts.onLogin ()->
#   # redFlag...  We should use the userId but meteor won't let us use Meteor.user() here!!!
#   Meteor.call 'logLoginToConsole', null, (err, result) ->
#     return true

# Accounts.onLoginFailure ()->
#   Meteor.call "logFailedSigninAttempt", null, (err, result) ->
#     return true

# Accounts.onCreateUser ()->
#   EventTracker.trackSignup()
#   Meteor.call 'logSignupToConsole', null, (err, result) ->
#     return true