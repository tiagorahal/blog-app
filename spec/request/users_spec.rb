require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #show' do
    user = User.create!(name: 'Guy', photo: 'photo',
                        bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc cursus eros euismod,
       ullamcorper magna vel, pellentesque metus. Sed id cursus lorem.',
                        post_counter: 0)
    before { get "/users/#{user.id}" }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'show' template" do
      expect(response).to render_template('show')
    end
  end

  describe 'GET #index' do
    before { get '/' }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'show' template" do
      expect(response).to render_template('index')
    end
  end
end
