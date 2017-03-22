module Support
  def self.login_manual
    @me ||= FactoryGirl.create(:user, :email => "hung@yopmail.com", :password => "password")
    visit new_user_session_path
    fill_in 'user_email', :with=>@me.email
    fill_in 'user_password', :with=>@me.password
    click_button "Log in"
  end
end
