# frozen_string_literal: true

require 'rails_helper'

feature 'user features', type: :feature do
  feature 'create a new user' do
    before(:each) do
      visit 'users/new'
    end

    scenario 'with invalid params' do
      fill_in 'user[name]', with: 'P'
      click_on 'Create User'
      expect(page).to have_content('Name is too short')
    end

    scenario 'with valid params' do
      fill_in 'user[name]', with: 'Capos'
      attach_file('user[avatar]', Rails.root + 'app/assets/images/8904a4a44249bdee8ebd968bd0e74bcb_400x400.jpeg')
      click_on 'Create User'
      expect(page).to have_content('User was successfully created.')
    end
  end

  feature 'sign in' do
    before(:each) do
      visit 'users/new'
      fill_in 'user[name]', with: 'Capos'
      attach_file('user[avatar]', Rails.root + 'app/assets/images/8904a4a44249bdee8ebd968bd0e74bcb_400x400.jpeg')
      click_on 'Create User'
      click_on 'Log out'
      visit '/login'
    end

    scenario 'with invalid params' do
      fill_in 'session[name]', with: 'P'
      click_button 'Log in'
      expect(page).to have_content('Bad name. Try again.')
    end

    scenario 'with valid params' do
      fill_in 'session[name]', with: 'Capos'
      click_button 'Log in'
      expect(page).to have_content('Capos')
    end
  end
end
