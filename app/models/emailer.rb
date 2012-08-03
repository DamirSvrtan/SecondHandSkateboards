class Emailer < ActionMailer::Base
   def contact(recipient, subject, message, sent_at = Time.now)
      @subject = subject
      @recipients = recipient
      @from = 'no-reply@2ndHandSkateboarders.com'
      @sent_on = sent_at
	  @body["title"] = 'Naslov'
  	  @body["email"] = 'sender@yourdomain.com'
   	  @body["message"] = message
      @headers = {}
   end
end
