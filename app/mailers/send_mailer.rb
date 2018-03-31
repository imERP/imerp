class SendMailer < ApplicationMailer


  #  SendMailer.test(email, title, data ).deliver_later
  # 新建时通知
  def test(email, title, data)
    return false if email.blank?
    @mail ={
      email: email,
      data: data
    }
    mail(to: email, subject: title )
  end

end
