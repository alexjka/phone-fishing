class Spot < ApplicationRecord
  validates :name, presence: true

  has_many :reports
end
