Template.header.events
  'click .login-buttons-login':
    EventTracker.trackLoginOrSignup()
  'click .login-buttons-logout':
    EventTracker.trackLogout()