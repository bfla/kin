Template.index.events
  'click .facebook-login-trigger': () ->
    Accounts.loginWithFacebook
    EventTracker.trackLoginOrSignup
