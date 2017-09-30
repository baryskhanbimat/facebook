require 'rails_helper'
require 'capybara/rspec'
feature 'User log in and add post' do
  let(:user) { FactoryGirl.create(:user, confirmed_at: Time.now) }
  let(:friend) { FactoryGirl.create(:friend, confirmed_at: Time.now) }

  before { login_as(user, scope: :user) }

  # background do
  #   visit friendships_path
  # end

  scenario 'List all users' do
    logout(user, scope: :user)
    login_as(friend, scope: :friend)
    visit friendships_path
    expect(page).to have_content(user.email)
    expect(page).to have_content(friend.email)

    # File.write('2.html', page.body)
  end

  scenario 'Add friend' do
    logout(user, scope: :user)
    login_as(friend, scope: :friend)
    visit friendships_path
    click_on 'Add Friend'
    # find_link('Add friend', href: '/friendships?friend_id=#{friend.id}')
    expect(page).to have_content('Added friend')
  end
end
