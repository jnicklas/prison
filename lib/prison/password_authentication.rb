module Prison
  module PasswordAuthentication
    
    class << self
      def included(base)
        super
        base.extend ClassMethods
        authentication_validations(base)
      end
    
      def authentication_validations(base)
        base.validates_presence_of :email, :password, :password_confirmation
        base.validates_confirmation_of :password, :allow_blank => true
      end
    end
    
    attr_accessor :password, :password_confirmation
    
    module ClassMethods
      
    end
    
  end
end