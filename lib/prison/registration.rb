module Prison
  module Registration
    
    def self.included(base)
      super
      base.extend ClassMethods
    end
    
    attr_accessor :password, :password_confirmation
    
    module ClassMethods
      
    end
    
  end
end