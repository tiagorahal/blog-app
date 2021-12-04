require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(id: 1, name: 'Pedrinho', photo: 'none', bio: 'something on the bio', posts_counter: 0)
  end

  it 'Validates name presence' do
    @user.name = nil
    expect(@user).not_to be_valid
  end

  it 'Validates photo presence' do
    @user.photo = nil
    expect(@user).not_to be_valid
  end

  it 'Validates name length' do
    @user.name = 'Mi'
    expect(@user).not_to be_valid
  end

  it 'Validates photo length' do
    @user.photo = 'Mi'
    expect(@user).not_to be_valid
  end

  it 'Validates bio length' do
    @user.bio = 'Mi'
    expect(@user).not_to be_valid
  end

  it 'Validates posts_counter value' do
    @user.posts_counter = -2
    expect(@user).not_to be_valid
  end

  it 'Returns the last three posts for that user' do
    @user.save
    x = 0
    until x == 3
      User.find_by(id: 1).posts.create(
        title: "This is the #{x} post",
        text: "This is the #{x} post text",
        comments_counter: 0,
        likes_counter: 0
      )
      x += 1
    end

    array = []
    @user.show_recent.each { |post| array.push(post) }

    expect(array.length).to be 3
  end
end
