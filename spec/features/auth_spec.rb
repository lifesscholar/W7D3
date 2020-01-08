require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content 'New user'
  end

  feature 'signing up a user' do
    before(:each) do
        visit new_user_url
        fill_in 'email', with: 'bacon@pig.com'
        fill_in 'password', with: 'hunter12'
        click_on 'Create User'
    end

    scenario 'shows email on the homepage after signup' do
       expect(page).to have_content "bacon@pig.com"
    end
  end
end

feature 'logging in' do
  scenario 'shows username on the homepage after login' do

  end

end

feature 'logging out' do
  scenario 'begins with a logged out state' do

  end

  scenario 'doesn\'t show username on the homepage after logout' do

  end
end