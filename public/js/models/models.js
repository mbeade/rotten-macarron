/**
 * Created with JetBrains RubyMine.
 * User: matias
 * Date: 9/19/12
 * Time: 4:29 PM
 * To change this template use File | Settings | File Templates.
 */


Movie = Backbone.Model.extend({
    url: "movie",

    initialize: function(){
        console.log("--Movie initialized--");

       //How listener to onChange events over attributes
       /* this.on("change:title", function(){
            var title = this.get("title");
            console.log("The  title of the movie has been changed to.. " + title);
        })*/
    },
    defaults: {
        title: 'unknown',
        rating: 'unknown',
        release: 'unknown',
        description: 'unknown'
    }
});




