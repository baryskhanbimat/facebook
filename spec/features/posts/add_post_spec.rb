require 'rails_helper'
require 'capybara/rspec'
feature 'User log in and add post' do
  let(:user) { FactoryGirl.create(:user, confirmed_at: Time.now) }

  before { login_as(user, scope: :user) }

  scenario 'user can add posts', js: true do
    p user

    visit root_path

    fill_in 'post[title]', with: 'test title'
    fill_in 'post[body]', with: 'test body'

    click_button 'Save'

    expect(page).to have_content('Тема Body')
    expect(page).to have_content('Тема Body')
  end

  scenario 'they see Invalid Email or password on the page' do
    logout(:user)
    visit root_path

    fill_in 'user[email]', with: 'username@gmail.com'
    fill_in 'user[password]', with: 'united'
    click_button 'Log in'

    expect(page).to have_content('Invalid Email or password')
  end
end
