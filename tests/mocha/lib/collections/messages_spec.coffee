MochaWeb?.testOnly ->
  describe "Messages", ->

    describe "validateMessage", ->

      it "should fail and add correct error if the message has no text", ->
        messageAttributes = {text: ""}
        errors = validateMessage(messageAttributes)
        chai.assert.equal "You can't send a blank message", errors.text
      
      it "should not report any text validation errors if the text is valid", ->
        messageAttributes = {text: "This is a valid message"}
        errors = validateMessage(messageAttributes)
        chai.assert.equal false, errors.text?

    describe "Meteor.methods.messageInsert", ->
      it "should add correct message to database if the request is valid", ->
        messageAttributes = {text: "This is a valid message"}
        messageId = Meteor.call('messageInsert', messageAttributes)
        chai.assert 1, Messages.find(messageId).count

