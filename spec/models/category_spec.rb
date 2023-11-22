require 'rails_helper'

RSpec.describe Category, type: :model do
  Rails.application.routes.default_url_options[:host] = 'localhost:3000'
  let(:user) { User.new(name: 'Margaret', email: 'margaret@gmail.com', password: 'password') }
  let(:category) { Category.new(name: 'Food', user:) }
  before { user.save }
  before { category.save }
  context 'validity:' do
    it 'is valid with required attributes' do
      expect(category).to be_valid
    end
    it 'shows the exact users name' do
      expect(category.name).to eq('Food')
    end
  end
  context 'invialidity:' do
    it 'is not valid when name is not present' do
      category.name = nil
      expect(category).not_to be_valid
    end
  end
end
