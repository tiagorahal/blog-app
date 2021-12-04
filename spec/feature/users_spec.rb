require 'rails_helper'

describe 'UsersController', type: :feature do
  User.create(
    id: 1,
    name: 'Peter',
    photo: 'none',
    bio: 'some bio',
    posts_counter: 0
  )

  it 'Renders the index page' do
    visit '/users'
    expect(page).to have_text('Peter')
  end

  it 'Renders the profile page' do
    visit '/users/1'
    expect(page).to have_text('Bio')
  end
end
