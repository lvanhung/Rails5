require 'rails_helper'

RSpec.feature "SignInOuts", type: :feature do
  feature 'sign in' do
    # background do
    #   User.create(email: "hung@yopmail.com", password: 'password')
    # end
    scenario "User login" do
      visit new_user_session_path
      @me ||= FactoryGirl.create(:user, :email => "hung@yopmail.com", :password => "password")
      # p @me
      fill_in 'user_email', :with=>"hung@yopmail.com"
      fill_in 'user_password', :with=>"password"
      click_on('Log in')
      # find("#log-in").trigger("click")
      sleep 2
      # save_and_open_page
      expect(page).to have_text('Welcome')
    end

    scenario "User log out" do
      visit new_user_session_path
      @me ||= FactoryGirl.create(:user, :email => "hung@yopmail.com", :password => "password")
      fill_in 'user_email', :with=>"hung@yopmail.com"
      fill_in 'user_password', :with=>"password"
      click_button "Log in"

      click_link "Logout"
      page.should have_content('Login')
    end

  end
end

#
# fill_in 'user_email' , with: 'hung@yopmail.com'
# fill_in 'user_password', with: 'password'
# fill_in 'user_password_confirmation', with: 'password'