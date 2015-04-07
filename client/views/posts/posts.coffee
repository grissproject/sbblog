Meteor.subscribe 'authors';
Meteor.subscribe 'Posts';
Meteor.subscribe 'Comments';

Template['posts'].helpers
  'posts': -> Posts.find({}, sort: {createdAt: -1})

Template.post.helpers
  'comments': -> Comments.find({post_id: @post._id})

# Template['posts'].events

Template['new-post'].events
  'submit .new-post': (e) ->
    e.preventDefault()
    Posts.insert
      'title': e.target.title.value
      'content': e.target.content.value
      'author': Meteor.userId()
      'createdAt': new Date()

Template.new_comment.events
  'submit .new_comment': (e) ->
    e.preventDefault()
    Comments.insert
      'title': e.target.title.value
      'content': e.target.content.value
      'author': e.target.author.value
      'post_id': e.target.post_id.value
      'createdAt': new Date()