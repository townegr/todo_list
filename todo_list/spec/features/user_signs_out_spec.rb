require 'spec_helper'

feature 'user signs out', %Q{
  As an authenticated user
  I want to sign out
  So that I can exit the system
} do

  scenario 'user can log out' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    click_on 'Log Out'

    expect(page).to have_content('Signed out successfully.')
    expect(current_url).to eq(root_url)
  end
end
