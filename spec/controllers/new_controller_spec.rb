require 'rails_helper'
# per https://stackoverflow.com/questions/38421853/why-is-my-rspec-not-loading-devisetestcontrollerhelpers
# to avoide 'Devise::MissingWarden' error
RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
end

# not using genre controller, so ignore this test page
# RSpec.describe NewController, type: :controller do
#
#   describe "GET #genre" do
#     it "returns http success" do
#       get :genre
#       expect(response).to have_http_status(:success)
#     end
#   end
#
# end
