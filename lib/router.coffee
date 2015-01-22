Router.configure
  layoutTemplate: 'layout'
  loadingTemplate: 'loading'
  notFoundTemplte: 'notFound'

# Landing page (not logged in)
Router.route '/', {template: 'newKinship'}

# User home page
# Router.route '/startConversation', { name:'newConversation' }
# Router.route '/conversation', { name: 'conversation' }
Router.route '/newKinship', {name: 'newKinship'}
# Router.route '/newVerse', { name: 'newVerse' }

# Admin home page
# redFlag - Make sure admin is secure before adding anything sensitive to it!
# Router.route '/admin', {name: 'admin'}

options = {}
options.name = 'nearbyMatches'
options.template = 'nearbyMatches'
options.waitOn = () -> Meteor.subscribe('getMatchesNearby', Meteor.userId() )
options.stories = () ->
  # redFlag - this is returning the wrong data...
  stories = Stories.find()
  # stories = Meteor.subscribe('getMatchesNearby', Meteor.userId() )
  return stories
options.data = () -> {stories: options.stories()}

Router.route '/nearbyMatches', options

requireLogin = () ->
  if !Meteor.user()
    if Meteor.loggingIn()
      this.render(this.loadingTemplate)
    else
      # this.render('accessDenied')
      this.render('index')
  else
    this.next()

# Router.onBeforeAction(requireLogin, {only: 'newMessage'})
Router.onBeforeAction(requireLogin, {except: []})