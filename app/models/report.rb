class Report < ApplicationRecord
  validates :body, presence: true

  belongs_to :spot
  belongs_to :user
end
