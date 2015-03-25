function loadFixture(fixtures, collection) {
  var i;

  // collection.remove({ });
  if (collection.find().count() == 0) {
    for (i = 0; i < fixtures.length; i+= 1) {
      collection.remove({ });
      collection.insert(fixtures[i]);
    }
  }
}

Meteor.startup(function () {
  loadFixture(Fixtures['dummyFixture'], Posts);
});
