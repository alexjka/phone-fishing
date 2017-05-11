class Spot < ApplicationRecord
  validates :name, presence: true

  has_many :reports

  def send_sms(number)
    acct_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    from = ENV['TWILIO_PHONE_NUMBER']

    @client = Twilio::REST::Client.new acct_sid, auth_token

    message = @client.account.messages.create(
      :from => from,
      :to => '+1'+number,
      :body => 'There has been a new fishing report posted to your favorite spot!'
    )
  end
  
  def clean_number
    number = self.number.scan(/\d+/).join
    number[0] == "1" ? number[0] = '' : number
    number unless number.length != 10
  end
end
