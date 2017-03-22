Given(/^a user with username "([^"]*)" and password "([^"]*)"$/) do |email, password|
  @me ||= FactoryGirl.create(:user, :email => email, :password => password)
  @me.reload
end

When(/^I sign in manually as "([^"]*)" with password "([^"]*)"$/) do |email, password|
  @me = User.find_by_email(email)
  @me.password ||= password
  visit new_user_session_path
  fill_in 'user_email', :with=>email
  fill_in 'user_password', :with=>password
  click_button "Log in"
end

Then(/^I should be on the welcome page$/) do
  page.should have_content('Welcome')
end

Given(/^I am signed in$/) do
  visit new_user_session_path
  @me ||= FactoryGirl.create(:user, :email => "hung@yopmail.com", :password => "password")
  fill_in 'user_email', :with=>"hung@yopmail.com"
  fill_in 'user_password', :with=>"password"
  click_button "Log in"
end

Given(/^I click on "([^"]*)" button$/) do |name|
  click_link ('Logout')
end

Then(/^I should "([^"]*)" link$/) do |arg1|
  page.should have_content('Login')
end
