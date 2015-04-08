Meteor.subscribe 'authors';
Meteor.subscribe 'Posts';
Meteor.subscribe 'Comments';

Template['posts'].helpers
  'posts': -> Posts.find({}, sort: {createdAt: -1})

Template.post.helpers
  'comments': -> Comments.find({post_id: @post._id})
  'userIsAuthor': -> Meteor.userId() && Meteor.userId() == @post.author

# Template['posts'].events

Template.post.events
  'click .edit': (e) -> $('.edit_form').show()
  'click .remove': (e) -> Posts.remove @post._id

Template['post_form'].events
  'submit .post_form': (e) ->
    e.preventDefault()
    if e.target._id.value
      Posts.update e.target._id.value, {$set: {title: e.target.title.value, content: e.target.content.value}}
    else
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