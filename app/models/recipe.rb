class Recipe < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :hot_level
    validates :time
    validates :description
  end
  has_one_attached :image
  belongs_to :user
  belongs_to :genre
  #has_many :materials, inverse_of: :materials
  has_many :materials
  accepts_nested_attributes_for :materials, allow_destroy: true
  has_many :book_marks, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :steps, dependent: :destroy
  accepts_nested_attributes_for :steps, allow_destroy: true

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  def self.recipes_search(keyword)
    if keyword.present?
      recipes = Recipe.where('title LIKE ?', "%#{keyword}%")
      if recipes.present?
        return recipes
      end
    end
      Recipes.all
  end

end
