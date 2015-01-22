# MochaWeb?.testOnly ->
#   describe "Verses", ->

#     describe "validateVerse", ->

#       it "should fail and add correct error if the verse has no text", ->
#         verseAttributes = {text: ""}
#         errors = validateVerse(verseAttributes)
#         chai.assert.equal "You can't send a blank verse", errors.noText
      
#       it "should not report any text validation errors if the text is valid", ->
#         verseAttributes = {text: "This is a valid verse"}
#         errors = validateVerse(verseAttributes)
#         chai.assert.equal false, errors.text?

#     describe "Meteor.methods.verseInsert", ->
#       it "should add correct verse to database if the request is valid", ->
#         verseAttributes = {text: "This is a valid verse"}
#         verseId = Meteor.call('verseInsert', verseAttributes)
#         chai.assert verseAttributes.text, Verses.find(verseId).text