class UserMailer < ApplicationMailer
default :from => "schoolapp@dsiginc.com"
  
  def registration_confirmation(user)
    @user = user
    
    #attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
    mail :to =>  user.email_id, :subject => "Welcome to School Juntos"
  end

end
