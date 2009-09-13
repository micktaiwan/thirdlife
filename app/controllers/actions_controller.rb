class ActionsController < ApplicationController

  def destroy
    a = Action.find(params[:id])
    render(:status=>401) and return if a.character.user_id != current_user.id
    a.affect!
    a.destroy
    render(:nothing=>true)
  end

end

