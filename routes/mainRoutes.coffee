Router.route '/', ->
  @render 'posts'

Router.route 'posts/new', ->
  @render 'new-post'
