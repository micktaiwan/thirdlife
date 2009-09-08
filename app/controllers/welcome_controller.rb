class WelcomeController < ApplicationController

  def index
    if logged_in?
      redirect_to url_for(:controller=>'characters', :action=>'index')
    else
      redirect_to url_for(:controller=>'login', :action=>'index')
    end  

  end

end
