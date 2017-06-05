# README

project-02-lifebetter - https://life-better.herokuapp.com/


Users can add tips for life, that readers can see and vote up or down

Technologies Used

jQuery
HTML
CSS
gem file ‘paperclip' - to upload images
gem file ‘devise’ - to help migrate changes in DB
gem 'rspec' - to run tests
gem 'capybara' - further tests on website views
gem 'birthday' - Sign-Up sheet allows user to scroll to a birthday

Code I'm Proud Of

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

I'm proud of this code because the test actually creates a new user with password and a tip (comment), before the test simulates clicking on submit button to another page that shows a tip.

this required me to learn the capybara gem, and how rspec can switch pages in app and read the view's text. Problems-solving led me to find out that some gems can not easily be updated in gemfile.

I also like
  it "renders the index template" do
    get :index, :format => "html"
    expect(response).to render_template(:index)
  end

instead of testing the view from user's action (what the user will see when clicking a button), this tests the controller and what route is the controller's response. I learned that get :index is not calling the index function in the controller, but rather the name of the route index - which should bring a certain page template or partial page.   

Writing these tests required me to learn the different commands available are tests that start with describe, to, and let. To test views there are 'redirect_to',  'render_template', and 'have_http_status'.


Screen Shots

Take screen shots using control command shift 4. The image will be on your clipboard and you can paste it where you like with command v. If you paste it anywhere within a github text editing window, it will give you a markdown version.

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Using rails 5.1.1
Using rspec-core 3.6.0
ruby 2.4.0

* System dependencies

* Configuration

* Database creation

* Database initialization

* To run the test suite, may need to first run in terminal: gem install capybara:2.7.1
then in terminal run: rspec

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
