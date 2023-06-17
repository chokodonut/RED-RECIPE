class Step < ApplicationRecord
  with_options presence: true do
    #validates :step_no
    validates :content
  end
  has_many_attached :images
  belongs_to :recipe

end
