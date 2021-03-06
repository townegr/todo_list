module AuthenticationHelper
  def sign_in_as(user)
    visit new_user_session_path
    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_on 'Sign In'
  end
end
