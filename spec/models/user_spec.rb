require 'rails_helper'

RSpec.describe User, type: :model do
  Rails.application.routes.default_url_options[:host] = 'localhost:3000'
  let(:user) { User.new(name: 'Margaret', email: 'margaret@gmail.com', password: 'password') }

  before { user.save }

  context 'validity:' do
    it 'is valid with required attributes' do
      expect(user).to be_valid
    end
    it 'shows the exact users name' do
      expect(user.name).to eq('Margaret')
    end
    it 'shows the exact users email' do
      expect(user.email).to eq('margaret@gmail.com')
    end
    it 'shows the exact users password' do
      expect(user.password).to eq('password')
    end
  end
  context 'invialidity:' do
    it 'is not valid when name is not present' do
      user.name = nil
      expect(user).not_to be_valid
    end
  end
end
