require 'rspec'
require 'rails_helper'
require 'spec_helper'
puts "------running Rspec in #{Rails.env} environment-------"
# require '../app/controllers/users_controller'

# do not start next line with 'RSpec.' !!! otherwise, looks for two paramaters
describe UsersController, :type => :controller do
  render_views
  before do
    test_host  # so controller#index wont redirect to http://test.host/
  end

  it "renders the index template" do
    get :index, :format => "html"
    # 302 Found - This response code means that URI of requested resource has been changed temporarily. New changes in the URI might be made in the future. 
    expect(response).to have_http_status(302)
  end
    it "renders the index template" do
    get :index, :format => "html"
    # expect(response).to render_template(:index)
    expect(response).to redirect_to '/'
  end


end

# describe “GET index” do
#   # it “assigns @users” do
#   #   user = FactoryGirl.create(:user)
#   #   get :index
#   #   expect(assigns(:users)).to eq([user])
#   # end
#   it “renders the index template” do
#     get :index
#     expect(response).to render_template(“index”)
#   end
# end
