Template.verseItem.helpers
  verseBelongsToUser: () ->
    user = Meteor.user()
    if user
      return user._id is this.author
  authorIsMale: () ->
    return this.gender is "male"