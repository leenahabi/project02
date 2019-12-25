class Recipe < ApplicationRecord
  belongs_to :user
  has_many :questions , dependent: :destroy
  validates :title, presence: true 
  validates :ingredients, presence: true
  validates :directions, presence: true
end
