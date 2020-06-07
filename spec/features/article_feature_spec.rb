# frozen_string_literal: true

require 'rails_helper'

feature 'article features', type: :feature do
  let!(:category) do
    Category.create(name: 'Thrash metal')
  end

  feature 'create a new article' do
    before(:each) do
      visit 'users/new'
      fill_in 'user[name]', with: 'Capos'
      attach_file('user[avatar]', Rails.root + 'app/assets/images/8904a4a44249bdee8ebd968bd0e74bcb_400x400.jpeg')
      click_on 'Create User'
      click_on 'Create new article'
    end

    scenario 'invalid articles' do
      fill_in 'article[title]', with: 'P'
      fill_in 'article[text]', with: 'Lorem ipsum dolor sit amet,
                                      consectetur adipiscing elit,
                                      sed do eiusmod tempor incididunt ut
                                      labore et dolore magna aliqua.'
      attach_file('article[image]', Rails.root + 'app/assets/images/8904a4a44249bdee8ebd968bd0e74bcb_400x400.jpeg')
      check('Thrash metal')
      click_on 'Create Article'
      expect(page).to have_content('Title is too short (minimum is 3 characters)')
    end
  end
end
