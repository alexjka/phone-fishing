class User < ApplicationRecord
  validates :username, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :spots
  has_many :reports
  has_many :favorites

  def send_sms(spot)
    acct_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    from = ENV['TWILIO_PHONE_NUMBER']

    @client = Twilio::REST::Client.new acct_sid, auth_token

    text_body = "Howdy #{username}! There has been a new fishing report posted #{spot.name}."

    to = cell_number
    to = '+1' + to

    @client.messages.create(
      :from => from,
      :to => to,
      :body => text_body
    )
  end
end
