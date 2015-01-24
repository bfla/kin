Template.verseItem.helpers
  verseBelongsToUser: () ->
    user = Meteor.user()
    return user._id is this.author
  authorIsMale: () ->
    return this.gender is "male"