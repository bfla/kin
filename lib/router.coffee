Router.configure
  layoutTemplate: 'layout'
  loadingTemplate: 'loading'
  notFoundTemplate: 'notFound'

matcherOptions = {}
matcherOptions.template = 'nearbyMatches'
matcherOptions.loadingTemplate = 'loading'
matcherOptions.waitOn = () -> Meteor.subscribe('getMatchesNearby', Meteor.userId() )
matcherOptions.stories = () ->
  # redFlag - this is returning the wrong data...
  stories = Stories.find()
  # stories = Meteor.subscribe('getMatchesNearby', Meteor.userId() )
  return stories
matcherOptions.data = () -> {stories: matcherOptions.stories()}

Router.route '/', _.extend(matcherOptions, {name: 'home'})

Router.route '/nearbyMatches', _.extend(matcherOptions, {name: 'nearbyMatches'})


# Route for the 'history' view (with all of the user's stories)
historyOptions = {}
historyOptions.template = 'storyFeed'
historyOptions.waitOn = () ->
  Meteor.subscribe('storiesForUser')
historyOptions.stories = () ->
  return Meteor.subscribe('storiesForUser')
Router.route '/history', historyOptions

# Route for a single story of the user
# storyFeedDetailOptions = {}
# storyFeedDetailOptions.template = 'showStory'
# historyOptions.waitOn = () -> 
#   Meteor.subscribe('storyForUser', Meteor.userId() )
# historyOptions.data = () -> {stories, historyOptions.stories() }

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
Router.onBeforeAction(requireLogin, {only: ['nearbyMatches', 'home']})