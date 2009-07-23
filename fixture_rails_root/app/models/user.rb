class User < ActiveRecord::Base
  include Prison::PasswordAuthentication
end
