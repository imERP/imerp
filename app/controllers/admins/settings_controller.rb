class Admins::SettingsController < Admins::ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:test_mail, :test_sms]
  # layout "admin"

    before_action :set_setting, only: %i[edit update]

    def index
    end

    def edit
    end

    def update
      if @site_config.value != setting_param[:value]
        @site_config.value = setting_param[:value]
        @site_config.save
        @site_config.expire_cache
        redirect_to admins_settings_path, notice: "保存成功."
      else
        redirect_to admins_settings_path
      end
    end


  # GET /settings/test
  def test
    @test_mail = ""
  end

  # POST /settings/test_mail
  def test_mail
    if send_email(params[:mail_to], params[:email_subject],params[:email_body] )
      redirect_to admins_settings_test_path, notice: "mail send successfully "
    else
      flash.now[:alert] = "mail send error"
      render 'admin/settings/test'
    end
  end

  # POST /settings/test_sms
  def test_sms
    if send_sms(params[:mail_to], params[:code])
      redirect_to admins_settings_test_path, notice: "sms send successfully "
    else
      flash.now[:alert] = "mail send error"
      render 'admin/settings/test'
    end
  end

  def set_setting
    @site_config = Setting.find_by(var: params[:id]) || Setting.new(var: params[:id])
  end

  private

  def setting_param
    params[:setting].permit!
  end

  def send_email(email, email_subject, email_body)
    # SendMailer.send_mail(mail_to, email_subject, email_body).deliver_now
    data = {}
    data[:remark] = email_body
    SendMailer.test(email, email_subject, data).deliver_later
  end

  def send_sms(mail_to, code)
   System.test_sms(mail_to, code)
  end

  def hooks_settings_params
    params.require(:hooks_settings).permit(HooksSettings.keys)
  end

end
