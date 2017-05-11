class Apps::TextingController < ApplicationRecord
  def index
  end

  def send_text
    @phone = Phone.new(phone_params)
    @phone.send_sms(@phone.clean_number)
    redirect_to :back
  end

  private

  def phone_params
    params.require(:phone).permit(:cell_number)
  end

end
