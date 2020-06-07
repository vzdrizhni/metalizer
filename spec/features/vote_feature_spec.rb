require 'rails_helper'

feature 'vote features', type: :feature do
  Category.create(name: 'Thrash metal')

  feature 'create a new vote' do
    before(:each) do
      visit 'users/new'
      fill_in 'user[name]', with: 'Capos'
      attach_file('user[avatar]', Rails.root + 'app/assets/images/8904a4a44249bdee8ebd968bd0e74bcb_400x400.jpeg')
      click_on 'Create User'
      click_on 'Create new article'
      fill_in 'article[title]', with: 'Overkill'
      fill_in 'article[text]', with: 'Lorem ipsum dolor sit amet,
                                                             consectetur adipiscing elit, sed do eiusmod
                                                             tempor incididunt ut
                                                             labore et
                                                             dolore magna aliqua.'
      attach_file('article[image]', Rails.root + 'app/assets/images/8904a4a44249bdee8ebd968bd0e74bcb_400x400.jpeg')
      check('Thrash metal')
      click_on 'Create Article'
    end

    scenario 'vote' do
      click_on 'Vote'
      expect(page).to have_content('Thanks for your vote.')
    end

    scenario 'with valid params' do
      click_on 'Vote'
      click_on 'Unvote'
      expect(page).to have_content('Sorry')
    end
  end
end
