require 'spec_helper'

describe 'Create Restaurant' do
  context 'Restaurant Admin' do
    it 'can create a restaurant' do
      visit '/'
      click_on 'Login'
      fill_in 'Email', with: "denvergschool@gmail.com"
      fill_in 'Password', with: "password"
      click_on 'Sign in'
      click_on 'Request to create a new restaurant'
      fill_in 'Name', with: 'MONKEY BALL'
      fill_in 'Description', with: 'you need to ask?'
      click_on 'Create Restaurant'
      expect(page).to have_content('Thank you')
      click_on 'Home'
      click_on 'Logout'
      click_on 'Login'
      fill_in 'Email', with: "denvergschool@gmail.com"
      fill_in 'Password', with: "password"
      click_on 'Sign in'
      expect(page).to have_content('MONKEY BALL')
    end
  end
end
