require 'spec_helper'


 
describe 'Platform login', type: :feature do
  before do
    user = User.create(email: 'asdf@asdf.com', password: 'asdfasdf')
    visit '/'    
  end

  it 'can display the platform homepage' do
    expect(page).to have_content "OrderUp"
  end

  describe 'Platform/Restaurant Admin login' do
    it 'enables platform admins to log in' do
      click_on "Login"
      expect(page).to have_content "Password"
      fill_in "Email", with: "asdf@asdf.com"
      fill_in "Password", with: "asdfasdf"
      click_button "Sign in"
      expect(page).to have_content "Platform/Restaurant Admin Sign in"

    end

    it 'enables restaurant admin to log in' do
    end

  end
end

