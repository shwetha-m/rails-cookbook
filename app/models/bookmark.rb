class Bookmark < ApplicationRecord
  belongs_to :recipe
  belongs_to :category
  validates :recipe_id, uniqueness: { scope: :category_id, message: 'has already been added to this category' }
  validates :comment, length: { minimum: 6 }
end
