root = exports ? this

root.Authors = new Mongo.Collection 'authors'
root.Posts = new Mongo.Collection 'Posts'

root.Posts.attachSchema(
  new SimpleSchema(
    title:
      type: String

    content:
      type: String

    author:
      type: String

    createdAt:
      type: Date
  )
)

root.Posts.helpers(
)

root.Posts.allow(
  insert : -> 
    if !Meteor.userId()
      false
    else
      true

  update : ->
    if !Meteor.userId()
      false
    else
      true

  remove : ->
    if !Meteor.userId()
      false
    else
      true
)
