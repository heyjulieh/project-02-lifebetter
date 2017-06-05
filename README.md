# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# Acts_as_votable Gem

##### We started off with thumbs_up for integrating our voting system but instead ended up using acts_as_votable gem which was   more simpler to integrate in our project. 
##### The acts_as _votable gem adds up and downvotes for an item or class that you want to be voted on. We set up routes : 
            resources :tips do
             member do
            put "like", to: "tips#upvote"
            put "dislike", to: "tips#downvote"
         end

##### we incorporated the codes in our tips model and controller files. For showing the buttons on each tip, added codes on our tips/index.html.erb. 
##### the acts_as_votable gem was restricted only to users who were logged in. the authorization part was taken off by Devise gem. 
##### It also allows one voter per user for one tip hence a user is not able to vote twice on the same tip.
##### Another feature of acts_as_votable is that if a tip receives a certain amount of negative votes(dislikes), the tip gets deleted.
##### The challenge in this gem was getting it to add counts without having to refresh the page everything.  we were however, able to accomplish that with a redirect method.



# For future Project


## Adding comments
##### Again we started with researching for the commentator gem but will probably use acts_as_commentable with threading for our project’s needs. 
##### Again acts_as_comemntable with threading gem is simpler to add. It does require a comment template where it is able to render all comments with replies. 
##### The acts_as_commentable gem works well with acts_as _votable and the two are easier to integrate in a project. This gem also counts the of comments per tip. In the future, we hope to render our comments on the genre page with threaded comments



