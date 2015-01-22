Template.nearbyMatches.helpers
  stories: () ->
    return @stories
  hasStories: () ->
    if @stories?.count() > 0
      return true
    else
      return false
