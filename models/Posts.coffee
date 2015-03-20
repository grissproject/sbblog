root = exports ? this

root.Posts = new Mongo.Collection 'Posts'

root.Posts.attachSchema(
  new SimpleSchema(
    title:
      type: String

    content:
      type: String

    createdAt:
      type: Date
  )
)

root.Posts.allow(
  insert : -> true

  update : -> true

  remove : -> true
)
