Given(/^following books$/) do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  table.hashes.each do |row|
    FactoryGirl.create(:book, title: row['title'], price: row['price'], description: row['description'])
  end
  #pending # Write code here that turns the phrase above into concrete actions
end

Given(/^Signed me in system$/) do
  @me ||= FactoryGirl.create(:user, :email => "hung@yopmail.com", :password => "password")
  visit new_user_session_path
  fill_in 'user_email', :with=>@me.email
  fill_in 'user_password', :with=>@me.password
  click_button "Log in"

end

When(/^I visit index page$/) do
  visit books_path
end

Then(/^I should see the list of books$/) do
  page.should have_css("table tr", count: 2)
end
