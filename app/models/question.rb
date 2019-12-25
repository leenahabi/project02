class Question < ApplicationRecord
    belongs_to :user
    belongs_to :recipe
    has_many :answers , dependent: :destroy
    validates :question, presence: true 
end
