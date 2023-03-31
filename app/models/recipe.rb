class Recipe < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  belongs_to :genre
  has_many :materials, dependent: :destroy
  has_many :book_marks, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :steps, dependent: :destroy
  
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
end
