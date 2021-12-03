require 'rails_helper'

describe 'UsersController', type: :feature do
  it 'Renders the index page' do
    visit '/users'
    expect(page).to have_text('This is the Users homepage')
  end

  it 'Renders the profile page' do
    visit '/users/1'
    expect(page).to have_text('This is a User profile')
  end
end
