require 'rails_helper'

# route to GET TO login: /users/sign_in
RSpec.feature "Logins", type: :feature do
  user = User.create(username: "testman", password: "123456")  # password min is 6 characters
  tip_test = Tip.create(genre: "test_genre", title: "test_title", important: true, user_id: 1)

  it "user can log in", :type => :feature do
    puts "start of log in test"
    visit '/users/sign_in'
    puts "want  page:"
    # puts "#{page.body}"
    fill_in "user_username", with: "testman"
    fill_in 'user_password', with: "123456"
    # click_button "commit"
    # find_button(value: "Log in").click
    # click_button 'submit'
    # find('input[name= "commit"]').click
    find('input[value="Log in"]').click

    puts "want to redirect to page:"
    # puts "#{page.body}"

    expect(page).to have_content "Signed in successfully"
  end
  # pending "add some scenarios (or delete) #{__FILE__}"
end
