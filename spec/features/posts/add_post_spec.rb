require 'rails_helper'

feature 'Add post' do
  scenario 'Any user can add post', js: true do
    visit posts_path

    fill_in 'post[title]', with: 'test title'
    fill_in 'post[body]', with: 'test body'
    click_on 'Create Post'

    expect(page).to have_content('test title')
    expect(page).to have_content('test body')
  end
end
