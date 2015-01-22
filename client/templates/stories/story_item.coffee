Template.storyItem.rendered = () ->
  story = this.data
  Session.set('storyId', story._id)

Template.storyItem.helpers
  sortedChapters: () ->
    this.chapters.sort(createdAt: -1)