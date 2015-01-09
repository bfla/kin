MochaWeb?.testOnly ->
  describe "Permissions", ->

    describe "ownsDocument", ->

      it "should return false if user does not own the document", ->
        userId = Meteor.users.find("Brian")
        platoId = Meteor.users.find("Plato")
        doc = Messages.find(userId: platoId).limit(1)
        chai.assert.equal false, ownsDocument(userId, doc)

      it "should return true if user owns the document", ->
        userId = Meteor.users.find("Brian")
        doc = Messages.find(userId: userId).limit(1)
        chai.assert.equal true, ownsDocument(userId, doc)