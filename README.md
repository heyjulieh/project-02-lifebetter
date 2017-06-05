# README

project-02-lifebetter - https://life-better.herokuapp.com/

Users can add tips for life, that readers can see and vote up or down

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

## Code I'm Proud Of
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

# Acts_as_votable Gem

##### We started off with thumbs_up for integrating our voting system but instead ended up using acts_as_votable gem which was   more simpler to integrate in our project. That also enabled us to use lesser code to get a similar functionality as           thumbs_up.
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



# For future Project

## Adding comments
##### Again we started with researching for the commentator gem but will probably use acts_as_commentable with threading for our project’s needs. 
##### Again acts_as_comemntable with threading gem is simpler to add. It does require a comment template where it is able to render all comments with replies. 
##### The acts_as_commentable gem works well with acts_as _votable and the two are easier to integrate in a project. This gem also counts the of comments per tip. In the future, we hope to render our comments on the genre page with threaded comments


### Full testing of app 
#### So far there are three tests, to show some possibilies of rspec testing.
