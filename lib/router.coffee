Router.configure
  layoutTemplate: 'layout'
  loadingTemplate: 'loading'
  notFoundTemplte: 'notFound'

matcherOptions = {}
matcherOptions.template = 'nearbyMatches'
matcherOptions.waitOn = () -> Meteor.subscribe('getMatchesNearby', Meteor.userId() )
matcherOptions.stories = () ->
  # redFlag - this is returning the wrong data...
  stories = Stories.find()
  # stories = Meteor.subscribe('getMatchesNearby', Meteor.userId() )
  return stories
matcherOptions.data = () -> {stories: matcherOptions.stories()}

Router.route '/', matcherOptions

matcherOptions.name = 'nearbyMatches'
Router.route '/nearbyMatches', matcherOptions

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