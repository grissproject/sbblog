Meteor.subscribe 'authors';
Meteor.subscribe 'Posts';

Template['posts'].helpers
  'posts': -> Posts.find({}, sort: {createdAt: -1})
  'authorName': -> 
    author = Meteor.users.findOne(@author)
    return author.username if author.username
    return author.profile.name if author.profile.name

# Template['posts'].events

Template['new-post'].events
  'submit .new-post': (e) ->
    e.preventDefault()
    Posts.insert
      'title': e.target.title.value
      'content': e.target.content.value
      'author': Meteor.userId()
      'createdAt': new Date()