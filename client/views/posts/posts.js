Meteor.subscribe('Posts');

Template['posts'].helpers({
  'posts': function() {
    return Posts.find();
  }
});

Template['posts'].events({
});
