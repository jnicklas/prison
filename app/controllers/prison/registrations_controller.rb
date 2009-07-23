class Prison::RegistrationsController < ApplicationController
  unloadable

  #before_filter :redirect_to_root, :only => [:new, :create], :if => :signed_in?
  filter_parameter_logging :password

  def new
    @registration = Prison.new_registration_model
    render :template => 'registrations/new'
  end

  def create
    @registration = Prison.new_registration_model(params[:registration])
    if @registration.save
      ::PrisonMailer.deliver_confirmation(request.host, @registration)
      flash_notice_after_create
      redirect_to(url_after_create)
    else
      render :template => 'registrations/new'
    end
  end

private

  def flash_notice_after_create
    flash[:notice] = translate(:deliver_confirmation,
      :scope   => [:clearance, :controllers, :users],
      :default => "You will receive an email within the next few minutes. " <<
                  "It contains instructions for confirming your account.")
  end
  
  def url_after_create
    new_session_url
  end
end
