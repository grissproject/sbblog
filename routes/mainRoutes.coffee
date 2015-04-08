Router.route '/', ->
  @render 'posts'

Router.route 'posts/new', ->
  if !Meteor.userId()
    @render 'posts'
  else
    @render 'new_post'

Router.route 'posts/:_id', ->
  post = Posts.findOne _id: @params._id
  @render 'post', data: -> { post: post }

