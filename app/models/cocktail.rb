class Cocktail < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  has_many :doses
  has_many :ingredients, through: :doses
  validates :name, presence: true, uniqueness: true
end

