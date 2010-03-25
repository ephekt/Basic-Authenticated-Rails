class User < ActiveRecord::Base
  acts_as_authentic do
    require_password_confirmation false
  end
  
  has_many :questions

  def deliver_password_reset_instructions!  
    reset_perishable_token!  
    Notifier.deliver_password_reset_instructions(self)  
  end  
end
