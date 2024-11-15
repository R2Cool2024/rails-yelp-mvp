class Restaurant < ApplicationRecord
  CATEGORIES = ["chinese", "italian", "japanese", "french", "belgian"]
  
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :category, presence: true, inclusion: { in: ["chinese", "italian", "japanese", "french", "belgian"], allow_nil: false }
end
