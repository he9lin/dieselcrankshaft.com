class HomeController < ApplicationController
  def index
  end
  
  def about
  end
  
  def contacts
  end
  
  def inquery
    if params[:subject].blank? || params[:body].blank? || params[:name].blank?
      flash[:error] = "Please fill in both Name, Subject and Content. Thanks!"
      redirect_to contacts_url
    else 
      CustomerMailer.inquery(params).deliver 
      flash[:notice] = "Your inquery has been sucsessfully submitted!"
      redirect_to root_url 
    end
  end
  
end
