class Step < ApplicationRecord
  has_many_attached :images
  belongs_to :recipe

end
