require 'rails_helper'

RSpec.feature "Logins", type: :feature do
  user = User.create(username: "testman", password: "123456")  # password min is 6 characters
  tip_test = Tip.create(genre: "test_genre", title: "test_title", important: true, user_id: 1)

  it "user can log in", :type => :feature do
    puts "start of log in test (./spec/features/logins_spec.rb)"
    visit '/users/sign_in'    # route to GET TO login:
    fill_in "user_username", with: "testman"
    fill_in 'user_password', with: "123456"

    # these tests fail to activate button:
    # click_button "commit"
    # click_button 'submit'
    # find('input[value="Sign me up"]').click
    find('input[name= "commit"]').click

    expect(page).to have_content "Signed in successfully"
  end
end
