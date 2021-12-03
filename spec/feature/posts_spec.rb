require 'rails_helper'

describe 'PostsController', type: :feature do
  it 'Renders the page for all posts of a user' do
    visit '/users/1/posts'
    expect(page).to have_text('This is a User list of posts')
  end

  it 'Renders the specific post page' do
    visit '/users/1/posts/1'
    expect(page).to have_text('This is a User particular post')
  end
end
