class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_one_attached :photo

  after_commit :attach_default_photo, on: [:create]

  def attach_default_photo
    return if photo.attached?

    default_image_path = Rails.root.join('app', 'assets', 'images', 'default-photo.png')
    photo.attach(io: File.open(default_image_path), filename: 'default-photo.png', content_type: 'image/png')
  end
end
