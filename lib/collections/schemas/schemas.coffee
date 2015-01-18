@Schema = {}

Schema.Story = new SimpleSchema
  userIds:
    type: [Object]
    label: "The 2 users communicating in this exchange"
  checkedBy:
    type: [Object]
    optional: true
    label: "Which user accepted this story"
  rejectedBy: 
    type: [Object]
    optional: true
    label: "Which users rejected this story"
  usersAreKin:
    type: Boolean
  createdAt:
    type: Date
  updatedAt: 
    type: Date

  # These ones exist in order to make sorting queries easier:
  latestChapterAddedAt:
    type: Date
  latestStarterAddedAt:
    type: Date
  latestVerseAddedAt:
    type: Date
    optional: true
  
  # Chapters
  chapters: 
    type: [Schema.Chapter] # This might not be right...

Schema.Chapter = new SimpleSchema
  starter: 
    type: Schema.Starter
  createdAt:
    type: Date
  updatedAt:
    type: Date
  verses: 
    type: [Schema.Verse] # This might not be right...

  
Schema.Starter = new SimpleSchema
  text:
    type: String
    regEx: /([^\s]*)/
    label: "The text content of the conversation starter"
  connectionLevel:
    type: Number
    allowedValues: [1, 2, 3]
    label: "The level of vulnerability for this question. Higher means more intimate."
  createdAt:
    type: Date

Schema.Verse = new SimpleSchema
  author:
    type: Object
    label: "The user who authored the verse (message)"
  reader:
    type: Object
    label: "The user who received the verse (message)"
  text:
    type: String
    regEx: /([^\s]*)/
    label: "The text content of the verse (message)."
  createdAt:
    type: Date



