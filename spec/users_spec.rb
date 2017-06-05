require 'rspec'
require 'rails_helper'
require 'spec_helper'
puts "------running Rspec in #{Rails.env} environment-------"
puts "start of Sign-Up test (./spec/usertips_spec.rb)"
# require '../app/controllers/users_controller'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end
# do not start next line with 'RSpec.' !!! otherwise, looks for two paramaters
describe UsersController, :type => :controller do

  render_views
  before do
    test_host  # so controller#index wont redirect to http://test.host/
  end

  it "renders the index template" do
    get :index, :format => "html"
    # 302 Found - This response code means that URI of requested resource has been changed temporarily. New changes in the URI might be made in the future.
    # remarkably - rspec does not allow 'one of' or if else.
    # HTTP Status Code 200: The request has succeeded
    expect(response).to have_http_status(200)
  end
    it "renders the index template" do
    get :index, :format => "html"
    # this fails
    # expect(response).to render_template(:index)
    # this works when not testing capyabera
    # expect(response).to redirect_to '/'  # route for home page
    expect(response).to render_template(:index)  # index is route for homepage
  end
end
