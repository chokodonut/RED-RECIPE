class Recipe < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  belongs_to :genre
  has_many :materials, dependent: :destroy
  has_many :book_marks, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :steps, dependent: :destroy
end
