class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient
  validates :description, presence: true
  validates :cocktail, presence:true
  validates  :ingredient, presence:true
  validates :cocktail, uniqueness: {scope: :ingredient}
  #validates :dose, uniqueness:true, :scope: {:cocktail, :ingredient}

end

