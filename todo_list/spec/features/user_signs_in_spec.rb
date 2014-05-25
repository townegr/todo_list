require 'spec_helper'

feature 'user signs in', %Q{
  As an authenticated user
  I want to sign in
  So that I can enter my system
} do

  # let(:user) { FactoryGirl.create(:user) }

  scenario 'signing in' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    expect(page).to have_content("Signed in successfully.")
    expect(current_url).to eq(root_url)
  end
end
