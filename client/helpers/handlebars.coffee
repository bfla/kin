Handlebars.registerHelper 'appName', () ->
  return 'kin'

Handlebars.registerHelper 'prettifyDate', (timestamp) ->
  date = new Date(timestamp)
  today = new Date()
  # yesterday = today.setDate(today.getDate() - 1)
  # timeOfDay = 

  if date.setHours(0,0,0,0) is today.setHours(0,0,0,0)
    #If the date is today...
    return 'today'
  # else if date.setHours(0,0,0,0) is yesterday.setHours(0,0,0,0)
  #   return 'yesterday'
  else
    return date.toString('yyyy-MM-dd')
 

  # likeminded
  # number37 or 30six or 36_____
  # versed - already taken by some stupid bible app
  # verse - not much used. there is an IBM product, but I might be able to beat it out.
  # converse
  # tide - available but P&G's Tide will always win on SEO...
  # tiding 
  # rendevous
  # vibe
  # tidal - already taken by some stupid music app
  # SpillIt