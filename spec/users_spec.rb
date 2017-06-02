require 'rspec'
require 'rails_helper'
require 'spec_helper'
puts "------running Rspec in #{Rails.env} environment-------"
# require '../app/controllers/users_controller'

# do not start next line with 'RSpec.' !!! otherwise, looks for two paramaters
describe UsersController, :type => :controller do
  before do
    test_host  # so controller#index wont redirect to http://test.host/
  end
  # it "should get index" do
  #   get :index #, params: hash_params
  #   # assert_response :success
  #   expect(response).to render_template("Found")
  # end

  # describe  "renders the index template" do
  #   subject { get :index }
  #
  #   specify { should render_template(:index) }
  # end
    it "renders the index template" do
    get :index
    expect(response).to render_template("index")
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
