require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before :each do
    @user = User.create(name: 'bob', photo: 'photo', bio: 'text')
    @post = @user.posts.create(title: 'bob text', text: 'text', user_id: @user.id)
  end

  describe 'GET /index' do
<<<<<<< HEAD
    before(:each) { get user_posts_path(@user, @post) }
=======
    # pending "add some examples (or delete) #{__FILE__}"
    before(:each) { get '/users/:user_id/posts' } # get(:index)
>>>>>>> d1e3747a0516858e8857cb99d26adfeb8218ac8d

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template(:index)
    end

    it 'body includes correct plaaceholder text' do
<<<<<<< HEAD
      expect(response.body).to include('<title>Blog</title>')
=======
      expect(response.body).to include('<h1>Posts#index</h1>')
>>>>>>> d1e3747a0516858e8857cb99d26adfeb8218ac8d
    end
  end
end
