require 'spec_helper'

describe 'Cart', type: :feature do
  
  context "when the cart is empty" do

    it "shows an error message" do
      visit '/kfc-2'
      save_and_open_page
      click_on 'Cart'
      page.should have_content("You must add an item before viewing your cart")
    end
  end

  context "logged out" do
    it "adds items to the cart" do
      item = create(:item)
      visit '/kfc-2'
      first(".add-to-cart").click
      click_on 'Cart'
      page.within(".order-item") do
        page.should have_content(item.name)
      end
    end
  end



  context "logged in" do
    it "shows cart items after signing back in" do
      user = create(:user)
      login(user)
      item = create(:item)
      visit '/kfc-2'
      first(".add-to-cart").click
      click_on "Cart"
      page.within(".order-item") do
        page.should have_content(item.name)
      end
      click_on 'Logout'

      page.should have_content('Login')
      login(user)
      click_on 'Cart'
      page.within(".order-item") do
        page.should have_content(item.name)
      end
    end
  end


end
