class CustomerMailer < ActionMailer::Base
  default :from => "crank518@gmail.com"  

  def inquery(params)  
    @params = params
    mail(:to => "crank518@gmail.com", :subject => "dieselcrankshaft.com inquery: #{params[:subject]}")  
  end
  
end
