require 'rails_helper'
require 'capybara/rspec'
feature 'User log in and add post' do
  let(:user) { FactoryGirl.create(:user, confirmed_at: Time.now) }

  before { login_as(user, scope: :user) }

  background do
    p user
    visit root_path
  end

  scenario 'user can add posts', js: true do
    fill_in :post_title, with: 'test title'
    fill_in :post_body, with: 'test body'
    find('input[name="commit"]').click

    p URI.parse(current_url).to_s
    # sleep(60)
    # File.write('2.html', page.body)
    # expect { subject }.to change(Post, :count).by(1)
    expect(page).to have_content('test title')
    expect(page).to have_content('test body')

    fill_in :comment_body, with: 'test comment'
    click_button 'Send'
    expect(page).to have_content('test comment')
  end

  scenario 'they see Invalid Email or password on the page' do
    logout(:user)
    visit root_path

    fill_in 'user[email]', with: 'username@gmail.com'
    fill_in 'user[password]', with: 'united'
    click_button 'Log in'

    expect(page).to have_content('Invalid Email or password')
  end

  scenario 'Anonymous user cant add comment to post' do
    expect(page).to_not have_content 'comments'
  end
end
