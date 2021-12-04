require 'rails_helper'

describe 'PostsController', type: :feature do
  User.create(
    id: 1,
    name: 'Peter',
    photo: 'none',
    bio: 'some bio',
    posts_counter: 0
  )

  User.find_by(id: 1).posts.create(
    title: 'This is the first post',
    text: 'This is the first post text',
    comments_counter: 0,
    likes_counter: 0
  )

  it 'Renders the page for all posts of a user' do
    visit '/users/1/posts'
    expect(page).to have_text('Peter')
  end

  it 'Renders the specific post page' do
    visit '/users/1/posts/1'
    expect(page).to have_text('This is the first post')
  end
end
