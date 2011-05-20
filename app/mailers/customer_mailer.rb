class CustomerMailer < ActionMailer::Base
  default :from => "cranker518@gmail.com"  

  def inquery(params)  
    @params = params
    mail(:to => "cranker518@gmail.com", :subject => "dieselcrankshaft.com inquery: #{params[:subject]}")  
  end
  
end
