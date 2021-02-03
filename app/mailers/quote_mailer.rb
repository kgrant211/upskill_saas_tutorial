class QuoteMailer < ApplicationMailer
    default from: 'kyle.grant5@gmail.com'
    
    
    def quote_email(name, email, description, user)
       @name = name
       @email = email
       @description = description
       @user = user
       
       mail(to: @user.email, subject: 'New Quote Request!')
    end
end
