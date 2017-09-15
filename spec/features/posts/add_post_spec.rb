# require 'rails_helper'
# require 'capybara/rspec'
# feature 'User log in and add post' do
#   let!(:user) { create(:user, confirmed_at: DateTime.now) }
#   before { user.skip_confirmation! }
#   scenario 'user can add posts', js: true do
#     visit root_path
#
#     click_link 'Sign up'
#
#     p page.body
#
#     fill_in 'user[email]', with: 'baryskhan17@gmail.com'
#     fill_in 'user[password]', with: 'united'
#     click_button 'Log in'
#
#     fill_in 'post[title]', with: 'test title'
#     fill_in 'post[body]', with: 'test body'
#
#     expect(page).to have_content('test title')
#     expect(page).to have_content('test body')
#   end
#
#   scenario 'they see Invalid Email or password on the page' do
#     visit root_path
#
#     fill_in 'user[email]', with: 'username@gmail.com'
#     fill_in 'user[password]', with: 'united'
#     click_button 'Log in'
#
#     expect(page).to have_content('Invalid Email or password')
#   end
# end
