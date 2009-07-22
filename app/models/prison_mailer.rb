class PrisonMailer < ActionMailer::Base

  def change_password(host, user)
    default_url_options[:host] = host
    from       Prison.do_not_reply
    recipients user.email
    subject    I18n.t(:change_password, :scope   => [:clearance, :models, :clearance_mailer], :default => "Change your password")
    body       :user => user
  end

  def confirmation(host, registration)
    default_url_options[:host] = host
    from       Prison.do_not_reply
    recipients registration.email
    subject    I18n.t(:confirmation, :scope   => [:clearance, :models, :clearance_mailer], :default => "Account confirmation")
    body       :registration => registration
  end

end
