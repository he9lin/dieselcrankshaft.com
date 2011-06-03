class HomeController < ApplicationController
  
  layout :resolve_layout
  
  def index
  end
  
  def about
  end
  
  def equipments
  end
  
  def contacts
  end
  
  def inquery
    if params[:subject].blank? || params[:body].blank? || params[:name].blank? || params[:email].blank? || params[:company].blank?
      flash[:error] = "Please fill in both Name, Email, Company name, Subject and Content. Thanks!"
      redirect_to contacts_url
    else 
      CustomerMailer.inquery(params).deliver 
      flash[:notice] = "Your inquery has been sucsessfully submitted!"
      redirect_to root_url 
    end
  end
  
  private

  def resolve_layout
    case action_name
    when "equipments", "contacts"
      "product"
    else
      "application"
    end
  end
  
end
