Meteor.subscribe 'Posts';

Template['posts'].helpers
  'posts': -> Posts.find({}, sort: {createdAt: -1})

# Template['posts'].events

Template['new-post'].events
  'submit .new-post': (e) ->
    e.preventDefault()
    Posts.insert
      'title': e.target.title.value
      'content': e.target.content.value
      'author': e.target.author.value
      'createdAt': new Date()