root = exports ? this

root.Comments = new Mongo.Collection 'Comments'

root.Comments.attachSchema(
  new SimpleSchema(
    title:
      type: String

    content:
      type: String

    author:
      type: String

    post_id:
      type: String

    createdAt:
      type: Date
  )
)

root.Comments.allow(
  insert : -> true

  update : -> true

  remove : -> true
)
