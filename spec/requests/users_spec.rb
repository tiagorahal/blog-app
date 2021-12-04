require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
<<<<<<< HEAD
    before(:each) { get users_path }
=======
    # pending "add some examples (or delete) #{__FILE__}"
    before(:each) { get users_path } # get(:index)
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
      expect(response.body).to include('<h1>Users#index</h1>')
>>>>>>> d1e3747a0516858e8857cb99d26adfeb8218ac8d
    end
  end
end
