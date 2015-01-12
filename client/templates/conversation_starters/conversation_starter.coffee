Template.conversationStarter.helpers
  fontAwesomeClasses: () ->
    switch this.typology
      when 'analysts' then classes = 'fa fa-lightbulb-o'
      when 'dreamers' then classes = 'fa fa-cloud'
      when 'explorers' then classes = 'fa fa-glass'
      when 'guardians' then classes = 'fa fa-newspaper-o'
    return classes

