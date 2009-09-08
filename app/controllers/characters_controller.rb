class CharactersController < ApplicationController

  before_filter :must_be_logged

  def index
    @characters = Character.find(:all, :conditions=>["user_id=?",current_user.id])
  end
  
  def new
    @character = Character.new
  end
  
  def create
    c = Character.new(params[:character])
    c.user_id = current_user.id
    c.save
    if c.errors.empty?
      redirect_back_or_default('/characters')
      flash[:notice] = I18n.t(:created_msg)
    else
      render :action => 'new'
    end
  end
  
end

