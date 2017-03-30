require 'rails_helper'

RSpec.feature "SignUps", type: :feature do

  feature "sign up" do
    scenario "sign up an account" do

      visit new_user_registration_path

      fill_in 'user_email' , with: 'hung@yopmail.com'
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'

      click_button ('Sign up')

      page.should have_content('Welcome')

    end

    scenario "sign up fail" do
      visit new_user_registration_path

      fill_in 'user_email' , with: 'hung@yopmail.com'
      fill_in 'user_password', with: ''
      fill_in 'user_password_confirmation', with: 'password'

      click_button ('Sign up')

      page.should have_content('Sign up')

    end

  end

end
