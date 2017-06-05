# README

project-02-lifebetter - https://life-better.herokuapp.com/

Users can add tips for life. They can peruse tips, and vote up or down on tips they love/hate.

Where Lifehacker meets Facebook meets Imgur.

## Technologies Used

jQuery
HTML
CSS
rails 5.1.1
Using rspec-core 3.6.0
ruby 2.4.0
gem file ‘paperclip' - to upload images
gem file ‘devise’ - to help migrate changes in DB
gem 'rspec' - to run tests
gem 'capybara' - further tests on website views
gem 'birthday' - Sign-Up sheet allows user to scroll to a birthday

## Code Addy is Proud Of
```
  RSpec.feature "Logins", type: :feature do
    user = User.create(username: "testman", password: "123456")  
    tip_test = Tip.create(genre: "test_genre", title: "test_title", important: true, user_id: 1)

    it "user can log in", :type => :feature do
      puts "start of log in test (./spec/features/logins_spec.rb)"
      visit '/users/sign_in'    # route to GET TO login:
      fill_in "user_username", with: "testman"
      fill_in 'user_password', with: "123456"
      find('input[name= "commit"]').click
      expect(page).to have_content "Signed in successfully"
    end
  end
  ```

I'm proud of this code because the test actually creates a new user with password and a tip (comment), before the test simulates clicking on submit button to another page that shows a tip.

this required me to learn the capybara gem, and how rspec can switch pages in app and read the view's text. Problems-solving led me to find out that some gems can not easily be updated in gemfile.

I also like
```
  it "renders the index template" do
    get :index, :format => "html"
    expect(response).to render_template(:index)
  end
  ```

instead of testing the view from user's action (what the user will see when clicking a button), this tests the controller and what route is the controller's response. I learned that get :index is not calling the index function in the controller, but rather the name of the route index - which should bring a certain page template or partial page.   

Writing these tests required me to learn the different commands available are tests that start with describe, to, and let. To test views there are 'redirect_to',  'render_template', and 'have_http_status'.

* To run the test suite, may need to first run in terminal: gem install capybara:2.7.1
then in terminal run: rspec



### Devise
 ##### Devise is a popular authentication solution for Rails applications. It provides a full array of features, and can be configured to meet all, but the most unusual, requirements
 
##### Devise gem helped in this project to get the sign up and login page autheticated. It added additional features such as "Forgot Password", "Resend Email" and "Delete Account" together with many more

##### It also helped restrict certain actions as well. Devise can be customized as well. See below the code that helped our project with restrict access.

    class ApplicationController < ActionController::Base
        protect_from_forgery with: :exception

        before_action :configure_permitted_parameters, if: :devise_controller?

        protected

        def configure_permitted_parameters
          # to allow custom fields to save on devise database
            added_attrs = [:username, :email, :password, :password_confirmation, :remember_me, :first_name, :last_name,     
            :birthday, :location, :avatar]
            devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
            devise_parameter_sanitizer.permit :account_update, keys: added_attrs
        end
     end


### Acts_as_votable Gem

##### We started off with thumbs_up for integrating our voting system but instead ended up using acts_as_votable gem which was   more simpler to integrate in our project. That also enabled us to use lesser code to get a similar functionality as           thumbs_up.
##### The acts_as _votable gem adds up and downvotes for an item or class that you want to be voted on. We set up routes : 
            resources :tips do
             member do
              put "like", to: "tips#upvote"
              put "dislike", to: "tips#downvote"
            end

##### I incorporated the codes in our tips model and controller files. For showing the buttons on each tip, added codes on our tips/index.html.erb. 
##### The acts_as_votable gem was restricted only to users who were logged in. the authorization part was taken off by Devise gem. 
##### It also allows one voter per user for one tip hence a user is not able to vote twice on the same tip.
##### Another feature of acts_as_votable is that if a tip receives a certain amount of negative votes(dislikes), the tip gets deleted.
##### The challenge in this gem was getting it to add counts without having to refresh the page everything.  we were however, able to accomplish that with a redirect method.



## Paperclip

### Allows users to upload photos. We added this to our User and Tip model.
     rails g paperclip user avatar // create avatar column for user model
     
in gemfile 

    gem "paperclip", git: "git://github.com/thoughtbot/paperclip.git"
     
in app/models/user.rb

    has_attached_file :avatar, styles: { medium: "300x300#", thumb: "100x100#" }, default_url: "profile.png"
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

in app/controllers/application_controller.rb

    def configure_permitted_parameters
      # to allow custom fields to save on devise database
      added_attrs = [:username, :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :birthday, :location, :avatar]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end
    
## Randomize tips (tip of the day)
in app/controllers/index_controller.rb

     def index
        #  find a random tip
        offset = rand(Tip.count)
        @tip = Tip.offset(offset).first
      end



# Project TBD in the Future

## Adding comments
##### Again we started with researching for the commentator gem but will probably use acts_as_commentable with threading for our project’s needs. 
##### Again acts_as_comemntable with threading gem is simpler to add. It does require a comment template where it is able to render all comments with replies. 
##### The acts_as_commentable gem works well with acts_as _votable and the two are easier to integrate in a project. This gem also counts the of comments per tip. In the future, we hope to render our comments on the genre page with threaded comments


### Full testing of app 
#### So far there are three tests, to show some possibilies of rspec testing.


# 2 Big Keys to a Responsive Website w/ Bootstrap

(This bit assumes you have added bootstrap to your html/css page.)

## Fix-ing Navbars and Affix-ing Sidebars
A great thing about Bootstrap is the ability to set sticky navbars/sidebars.. and really anything to the edges of a page. This is really useful when you have a lot of scrolling on a single page-- or are creating single page websites (which is super popular 
right now).

### For Navbars 
#### (or jumbotrons, or anything you want to stick horizontally to the top of the page)
You'll want to add div classes to the object you're trying to stick to the top of the page.
The one specific class you'll want to add is ```.navbar-fixed-top```besides the ```.navbar``` or ```.jumbotron``` or whatever class names you have for your div. This is super simple. This one bootstrap class name sets up the proper css and javascript in the background to make sure the navbar remains fixed but allows content to continue scrolling. However, there are CSS stylings you want to do + avoid:
  1. You'll want to have a positive z-index for the navbar so that content scroll under the navbar.
  2. Avoid setting a position (i.e. relative, absolute, fixed, etc.-- none of that!) because this messes with what Bootstrap has set up.
  3. You'll want to set your body's ```height``` to 100% and ```padding-top``` to some percent (depending on the height of your navbar).
  4. Depending on the height of your jumbotron/navbar,you'll finally set the content's ```margin-top``` to some positive number greater or equal to the navbar's height.
  5. Remember, you don't need to do any javascript or jquery with this-- unless you want to add additional functions.

Here's an example of it being used on a jumbotron/navbar using Ruby on Rails:
```
<div class="jumbotron-small navbar-fixed-top">
    <div class="logo-left">
      <a href="/"><p class="logo-left">COOL</p><p class="logo-right">page</p></a>
    </div>
    <div class="pull-right dropdown">
      <% if signed_in? %>
        <div class="dropbtn">
          Welcome, User!
          <%= image_tag("dropdown.png", height: "30") %>
        </div>
        <div class="dropdown-content">
          <%= link_to "View Profile", user_path(current_user) %>
          <%= link_to "Settings", edit_user_registration_path(current_user) %>
          <%= link_to "Art", '/genres/art' %>
          <%= link_to "Beauty", '/genres/beauty' %>
          <%= link_to "Food", '/genres/food' %>
          <%= link_to "Health", '/genres/health' %>
          <%= link_to "Home", '/genres/home' %>
          <%= link_to "Travel", '/genres/travel' %>
          <%= link_to "Sign Out", destroy_user_session_path, :method => :delete %>
        </div>
      <% else %>
        <%= button_to "Sign In", new_user_session_path %>
        <%= button_to "Sign Up", new_user_registration_path, :method => :get %>
      <% end %>
    </div>
  </div>
  ```
Here's an example of the CSS:
```
body {
  height: 100%;
  padding-top: 130px;
}
.jumbotron {
 margin: auto;
 color: white;
 height: 250px;
 clear: both;
 z-index: 100;
}
.main-content {
  padding: 15px 0 15px 0;
  width: 20%;
  margin-top: 100px;
  margin: auto;
  z-index: 150;
}
```

### For Sidebars
#### (or any vertical list of objects you want to stick vertically to your page)
You'll want to add div classes to the object you're trying to stick to the left or right of the page.
There are two specific class you'll want to add to your sidebar or vertical list of objects  ```.nav-stacked``` and ```.affix``` besides the ```#sidebar``` or ```ul``` or whatever class names you have for your verticla div. This is a bit more complicated than the horizontal navbar/jumbotron as you'll now need two classes. Like the horizontal example, these Bootstrap classes set up the proper css and javascript in the background to make sure the sidebar remains fixed but allows content to continue scrolling. Again, there are CSS stylings you want to do + avoid:
  1. You'll want to have a positive z-index for the sidebar so that content scroll under the navbar
  2. Avoid setting a position (i.e. relative, absolute, fixed, etc.-- none of that!) because this messes with what Bootstrap has set up.
  3. You'll want to set your body's ```height``` to 100% and a ```padding-top``` of some percent.
  4. Or you can set the content's ```margin-top``` depending on where the sidebar to be affixed.
  5. Remember, you don't need to do any javascript or jquery with this-- unless you want to add additional functions.

Here's an example of it being used on a sidebar using Haml on Rails (another language similar to Ruby ERB-- but DRYer!)
```
.container-fluid
  .row.
    .col-sm-3.col-md-3.col-lg-3
      .sidebar.nav-stacked.affix#sidebar
        .profile-userpic
          %a{:href => user_path}
            = image_tag @user.avatar.url, class: "img-responsive" #size: "150x100" or (:medium)
        .profile-usermenu
          %ul.nav.add_tip
            = link_to "Add New Tip", new_user_tip_path
          %ul.nav
            %li
              %a{:href => "/genres/art"}
                Art
            %li
              %a{:href => "/genres/beauty"}
                Beauty
            %li
              %a{:href => "/genres/health"}
                Fitness/Health
            %li
              %a{:href => "/genres/food"}
                Food
            %li
              %a{:href => "/genres/home"}
                Home/Living
            %li
              %a{:href => "/genres/travel"}
                Travel
```
Here's the CSS: 
```
.sidebar {
  display: inline-block;
  margin-top: 50px;
  margin-bottom: 50px;
  height: 100%;
  width: 100%;
  z-index: 100;
}
```

Here's a good resource for affixing navbars/sidebars:

- https://www.bootply.com/100983
- https://www.w3schools.com/bootstrap/bootstrap_affix.asp
  

## Hiding Objects At a Certain Width
While this is not a Bootstrap thing, this is something that only works in ES6+ browsers-- and is super handy in making sure your website is simplified when a user resizes their screens or when they're looking at your site from a mobile phone. The only thing you have to do is use CSS! Specifically, this is called the @media rule. You can use it to affect media based on the pages viewheight (vh), resolution, orientation (portrait or landscape), and a lot of other media measurements.

For example, if I want the sidebar to be hidden when a screen resizes to a size of 926px or smaller, the CSS looks like this:
```
@media only screen and (max-width: 926px) {
    #sidebar {
      display: none;
    }
}
```
Basically, the major code here is ```@media only screen and (max-width: [screensize#]px) {}```. Then within the closing brackets, you'll want to set the objects you want to hide when the screen size limit is met-- which in this case, is anything with an id name of sidebar, and ```display: none``` within it.

Here's another example-- where I want to hide anything with a p tag when the screen is 1026 or smaller:
```
@media only screen and (max-width: 1026px) {
        p {
          display: none;
        }
    }
```

For more information, you can visit:

- https://www.w3schools.com/cssref/css3_pr_mediaquery.asp
- https://www.emailonacid.com/blog/article/email-development/emailology_media_queries_demystified_min-width_and_max-width
- https://developer.mozilla.org/en-US/docs/Web/CSS/Media_Queries/Using_media_queries

