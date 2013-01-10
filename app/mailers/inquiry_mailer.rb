class InquiryMailer < ActionMailer::Base
  default :to => "rodolfosportella@gmail.com"

  def notification(inquiry)
    @inquiry = inquiry
    mail :reply_to => @inquiry.email, :subject => "New inquiry"
  end

end