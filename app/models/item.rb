class Item < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :item_categories, dependent: :destroy
  has_many :categories, through: :item_categories
  has_one_attached :icon

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0.0 }
end
