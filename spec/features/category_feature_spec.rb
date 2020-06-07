# frozen_string_literal: true

require 'rails_helper'

feature 'category features', type: :feature do
  feature 'create a new category' do
    before(:each) do
      visit 'users/new'
      fill_in 'user[name]', with: 'Capos'
      attach_file('user[avatar]', Rails.root + 'app/assets/images/8904a4a44249bdee8ebd968bd0e74bcb_400x400.jpeg')
      click_on 'Create User'
      user = User.first
      user.admin = true
      user.save
      click_on 'Capos'
      click_on 'Add category'
    end

    scenario 'with invalid params' do
      fill_in 'category[name]', with: ''
      click_on 'Create Category'
      expect(page).to have_content("Name can't be blank")
    end

    scenario 'with valid params' do
      fill_in 'category[name]', with: 'Death metal'
      click_on 'Create Category'
      expect(page).to have_content('Category was successfully created.')
    end
  end
end
