require 'rspec'
require 'rails_helper'
# require 'spec_helper'
# require '../app/controllers/users_controller'

# do not start next line with 'RSpec.' !!! otherwise, looks for two paramaters
describe UsersController, :type => :controller do
  it "should get index" do
    get :index #, params: hash_params
    assert_response :success
  end

  it "renders the index template" do
    get :index
    expect(response).to render_template("index")
  end

end
