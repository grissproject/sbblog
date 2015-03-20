Router.route('/', function () {
  this.render('posts');
  SEO.set({ title: 'Home -' + Meteor.App.NAME });
});
