class Notifier < ActionMailer::Base  
  def password_reset_instructions(user)  
    set_defaults
    subject "Password Reset Instructions"
    recipients user.email
    body :edit_password_reset_url => edit_password_reset_url(user.perishable_token)
  end  
  
  private
    def set_defaults
      random_token = ActiveSupport::Base64.encode64(rand(0x10000).to_s).tr("/+","_.").gsub(/=*\n/,"")
      from "AnswerWise <team+#{random_token}@simplyfor.us>"
      sent_on Time.current
      content_type "text/html"
    end  
end