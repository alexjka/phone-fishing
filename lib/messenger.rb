module Messenger
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
end
