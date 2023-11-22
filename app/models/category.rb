class Category < ApplicationRecord
  belongs_to :user
  has_many :item_categories, dependent: :destroy
  has_many :items, through: :item_categories
  has_one_attached :icon

  validates :name, presence: true
end
