class ApplicationMailer < ActionMailer::Base
  layout "mailer"
  default charset: "utf-8"
  default content_type: "text/html"

  default from:     proc { default_sender_address.format }
  default reply_to: proc { default_reply_to_address.format }

  default_url_options[:host] = "#{Setting.protocol}://#{Setting.host_name}"

  def default_sender_address
    address = Mail::Address.new(Setting.mailer_sender)
    address.display_name = Setting.mailer_sender_display_name
    address
  end

  def default_reply_to_address
    address = Mail::Address.new(Setting.mailer_reply_to)
    address.display_name = Setting.mailer_reply_display_name
    address
  end
end
