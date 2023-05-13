class Genre < ApplicationRecord
  has_many :recipes, dependent: :destroy
  validates :name, presence: true

  def self.recipes_search(genre_id)
    if genre_id.present?
      recipes = Recipe.where(genre_id: genre_id)
      if recipes.present?
        return recipes
      end
    else
      Recipe.all
    end
  end
end
