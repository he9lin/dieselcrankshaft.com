class DevelopmentMailInterceptor  
  def self.delivering_email(message)  
    message.subject = "[#{message.to}] #{message.subject}"  
    message.to = "qihe229@gmail.com"  
  end  
end