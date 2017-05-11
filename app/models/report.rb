class Report < ApplicationRecord
  validates :body, presence: true

  belongs_to :spot
  belongs_to :user

  # include Messenger
  #
  # def clean_number
  #   number = self.number.scan(/\d+/).join
  #   number[0] == "1" ? number[0] = '' : number
  #   number unless number.length != 10
  # end
end
