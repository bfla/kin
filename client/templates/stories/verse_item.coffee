Template.verseItem.helpers
  verseBelongsToUser: () ->
    return Meteor.user()._id is this.author
  authorIsMale: () ->
    return this.gender is "male"