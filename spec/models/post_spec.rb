require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:each) do
    User.create(id: 1, name: 'Peter', photo: 'none', bio: 'something on the bio', posts_counter: 0)
    @post = Post.new(id: 1, title: 'some title', text: 'some text', comments_counter: 0, likes_counter: 0, user_id: 1)
  end

  it 'Validates title' do
    @post.title = nil
    expect(@post).not_to be_valid
  end

  it 'Validates text' do
    @post.text = nil
    expect(@post).not_to be_valid
  end

  it 'Validates comments_counter' do
    @post.comments_counter = nil
    expect(@post).not_to be_valid
  end

  it 'Validates likes_counter' do
    @post.likes_counter = nil
    expect(@post).not_to be_valid
  end

  it 'Validates text length' do
    @post.text = 'a' * 255
    expect(@post).not_to be_valid
  end

  it 'Gets a post last 5 comments' do
    @post.save
    x = 0
    until x == 5
      Post.find_by(id: 1).comments.create(
        text: "This is the #{x} post comment",
        user_id: 1
      )
      x += 1
    end
    array = []

    @post.show_recent.each { |comment| array.push(comment) }

    expect(array.length).to be 5
  end
end
