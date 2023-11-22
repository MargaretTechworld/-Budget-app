require 'rails_helper'

RSpec.describe Item, type: :model do
  Rails.application.routes.default_url_options[:host] = 'localhost:3000'

  let(:user) { User.new(name: 'Margaret', email: 'margaret@gmail.com', password: 'password') }
  let(:item) { Item.new(name: 'Shoe', amount: 3000.0, author: user) }

  before { user.save }
  before { item.save }

  context 'validity:' do
    it 'is valid with required attributes' do
      expect(item).to be_valid
    end
    it 'shows the exact item name' do
      expect(item.name).to eq('Shoe')
    end
    it 'shows the exact item amount' do
      expect(item.amount).to eq(3000.0)
    end
  end

  context 'invialidity:' do
    it 'is not valid when name is not present' do
      item.name = nil
      expect(item).not_to be_valid
    end
    it 'is not valid when amount is not present' do
      item.amount = nil
      expect(item).not_to be_valid
    end
    it 'is not valid when amount is less or equal to zero' do
      item.amount = 0
      expect(item).not_to be_valid
    end
  end
end
