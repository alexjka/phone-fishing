class Spot < ApplicationRecord
  validates :name, presence: true

  has_many :reports
  has_many :users, :through => :favorites
  has_many :favorites
end
