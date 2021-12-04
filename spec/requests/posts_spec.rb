require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:example) { get '/users/1/posts' }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it 'Renders the right template' do
      expect(response).to render_template('index')
    end
  end

  describe 'GET /show' do
    before(:example) { get '/users/1/posts/1' }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it 'Renders the right template' do
      expect(response).to render_template('show')
    end
  end
end
