require 'spec_helper'

describe 'Login: ' do
  context 'Platform Admin' do
    it 'can log in and out of the platform site' do
      visit '/'
      # save_and_open_page
      click_on 'Login'
      fill_in 'Email', with: "denvergschool@gmail.com"
      fill_in 'Password', with: "password"
      click_on 'Sign in'
      expect(page).to have_content('Logout')
      click_on 'Logout'
      expect(page).to have_content('Login')
    end
  end
end
