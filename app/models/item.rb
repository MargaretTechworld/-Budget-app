class Item < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :item_categories, dependent: :destroy
  has_many :categories, through: :item_categories
end
