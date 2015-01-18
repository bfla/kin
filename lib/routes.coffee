Router.configure
  layoutTemplate: 'layout'
  loadingTemplate: 'loading'
  notFoundTemplte: 'notFound'

# Landing page (not logged in)
Router.route '/', {template: 'newKinship'}

# User home page
Router.route '/startConversation', { name:'newConversation' }
Router.route '/conversation', { name: 'conversation' }
Router.route '/newKinship', {name: 'newKinship'}
Router.route '/newVerse', { name: 'newVerse' }

# Admin home page
Router.route '/admin', {name: 'admin'}


options =
  waitOn: () ->
    Meteor.subscribe('matches')
  name: 'meetSomeoneNew'

Router.route '/meetSomeoneNew', options


# Signup screen
# Router.route '/signup-personality', {name: 'personalitySignup'}

# ConversationController = RouteController.extend
#   template: 'conversation'
#   increment: 5
#   postsLimit: -> return parseInt(@params.messagesLimit) || @increment
#   findOptions: -> return {sort: this.sort, limit: this.messagesLimit()}
#   subscriptions: -> @conversationSub = Meteor.subscribe('conversation', this.findOptions())
#   messages: -> return Messages.find({}, @findOptions())
#   data: ->
#     hasMore = @messages().count() is @messagesLimit()
#     res =
#       messages: @messages()
#       ready: @conversationSub.ready
#       # nextPath: hasMore ? @nextPath() : null
#     return res

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