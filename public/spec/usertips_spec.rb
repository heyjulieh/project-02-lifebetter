require 'rspec'
require 'rails_helper'

# do not start next line with 'RSpec.' !!! otherwise, looks for two paramaters
describe UsertipsController, :type => :controller do
  # first_user_id = User.all[1]["id"]
  it "should change tip" do
    puts 2
    # get :index #, params: hash_params
    # assert_response :success
  end
  #
  # it "renders the index template" do
  #   get :index
  #   expect(response).to render_template("index")
  # end

end
