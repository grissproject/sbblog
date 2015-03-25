Meteor.publish 'Posts', -> Posts.find()

Meteor.publish 'authors', -> Meteor.users.find()
