Router.route '/', ->
  @render 'posts'

Router.route 'posts/new', ->
  if !Meteor.userId()
    @render 'posts'
  else
    @render 'new-post'
