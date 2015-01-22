@Schema = {}

Schema.Story = new SimpleSchema
  userIds:
    type: [String]
    label: "The 2 users communicating in this exchange"
  checkedBy:
    type: [String]
    optional: true
    label: "Which user accepted this story"
  rejectedBy: 
    type: [String]
    optional: true
    label: "Which users rejected this story"
  newMatch:
    type: Boolean
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
    # redFlag - This should check against the chapter schema but...
    # the chapter schema is broken so 
    type: [Object]
  "chapters.$.createdAt":
    type: Date
  "chapters.$.updatedAt":
    type: Date
  "chapters.$.starter":
    type: Object
  "chapters.$.starter._id":
    type: String
    optional: true
  "chapters.$.starter.text":
    type: String
  "chapters.$.starter.connectionLevel":
    type: Number
  "chapters.$.starter.createdAt":
    type: Date
  "chapters.$.starter.updatedAt":
    type: Date
  "chapters.$.verses":
    type: [Object]
    optional: true
  "chapters.$.verses.$.author":
    type: String
  "chapters.$.verses.$.reader":
    type: String
  "chapters.$.verses.$.gender":
    type: String
    allowedValues: ["male", "female"]
  "chapters.$.verses.$.text":
    type: String
  "chapters.$.verses.$.createdAt":
    type: Date
  # "chapters.$":
    # type: Schema.Chapter

Schema.Chapter = new SimpleSchema
  createdAt:
    type: Date
  updatedAt:
    type: Date
  starter:
    type: Schema.Starter
  verses:
    type: [Schema.Verse]
    optional: true
  # "verses.$":
  #   type: Schema.Verse
  #   optional: true

Schema.Starter = new SimpleSchema
  _id:
    type: String
    optional: true
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
  updatedAt:
    type: Date

Schema.Verse = new SimpleSchema
  author:
    type: String
    label: "The id of the user who authored the verse (message)"
  reader:
    type: String
    label: "The id of user who received the verse (message)"
  text:
    type: String
    regEx: /([^\s]*)/
    label: "The text content of the verse (message)."
  createdAt:
    type: Date

Schema.Checkin = new SimpleSchema
  userId:
    type: String
  gender:
    type: String
    allowedValues: ["male", "female"]
  createdAt:
    type: Date
  updatedAt:
    type: Date
  geojson:
    type: Object
  "geojson.$.type":
    type: String
    allowedValues: ["Feature"]
  "geojson.$.geometry":
    type: Object
  "geojson.$.geometry.$.type":
    type: String
    allowedValues: ["Point"]
  "geojson.$.geometry.$.coordinates":
    type: [Object]