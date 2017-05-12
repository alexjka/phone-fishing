class Report < ApplicationRecord
  validates :body, presence: true

  belongs_to :spot
  belongs_to :user

  def clean_number
    number = self.number.scan(/\d+/).join
    number[0] == "1" ? number[0] = '' : number
    number unless number.length != 10
  end

  def send_sms
    acct_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    from = ENV['TWILIO_PHONE_NUMBER']

    @client = Twilio::REST::Client.new acct_sid, auth_token

    text_body = "Howdy #{user.username}! There has been a new fishing report posted #{spot.name}."

    to = @user.cell_number
    to = '+1' + to

    @client.account.create(
      :from => from,
      :to => to,
      :body => text_body
    )
  end

  # def favorite?
  #   :favorite.checked?
  # end
end
