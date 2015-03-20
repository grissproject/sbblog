Meteor.subscribe 'Posts';

Template['posts'].helpers
  'posts': -> Posts.find()

# Template['posts'].events
