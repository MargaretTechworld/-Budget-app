require 'rails_helper'

RSpec.describe ItemsController, type: :request do
  describe 'GET /index' do
    let(:user) do
      User.create(name: 'John Doe', email: 'john.doe@example.com', password: 'password',
                  password_confirmation: 'password')
    end

    before do
      allow_any_instance_of(CategoriesController).to receive(:authenticate_user!).and_return(true)
      allow_any_instance_of(CategoriesController).to receive(:current_user).and_return(user)

      category = Category.create(name: 'Category Name', user_id: user.id)
      get category_items_path(category_id: category.id)
    end

    it 'returns a successful response' do
      expect(response).to have_http_status(200)
    end

    it 'renders the correct template' do
      expect(response).to render_template(:index)
    end

    it 'includes the correct placeholder text in the response body' do
      expect(response.body).to include('ITEMS')
    end
  end
end
