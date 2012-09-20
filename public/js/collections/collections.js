//collection of movies

Movies = Backbone.Collection.extend({
    url: "movies",
    model: Movie
});