$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module Prison
  VERSION = '0.0.1'
  
  autoload :Registration, 'prison/registration'
  
  class << self
    attr_writer :registration_model
    attr_accessor :do_not_reply
    
    def registration_model
      if @registration_model.is_a?(Class)
        @registration_model
      else
        @registration_model.constantize
      end
    end
    
    def new_registration_model(attributes={})
      registration_model.new(attributes)
    end
  end
end

Prison.registration_model = 'User'
Prison.do_not_reply = 'noreply@example.com'