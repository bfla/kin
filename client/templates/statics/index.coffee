Template.index.events
  'click .facebook-login-trigger': () ->
    EventTracker.trackLoginOrSignup()
    Accounts.loginWithFacebook
