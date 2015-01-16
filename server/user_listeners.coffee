# This uses the UserStatus module
# fields has a userId, lastActivity, and connectionId

#Login also includes opening the website in the browser
UserStatus.events.on "connectionLogin", (fields) ->
  console.log 'THIS SHOULD TRIGGER WHEN THE USER LOGS IN'
  storeGeolocation()

UserStatus.events.on "connectionIdle", (fields) ->

UserStatus.events.on "connectionActive", (fields) ->
  console.log 'THIS SHOULD TRIGGER WHEN THE CONNECTION IS ACTIVE'
  storeGeolocation()

# 'Logging out' also includes closing the browser
UserStatus.events.on "connectionLogout", (fields) ->
