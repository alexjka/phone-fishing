class Report < ApplicationRecord
  validates :body, presence: true
end
