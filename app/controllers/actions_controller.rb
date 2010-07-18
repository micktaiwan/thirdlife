class ActionsController < ApplicationController

  def destroy
    a = Action.find(params[:id])
    char = a.character
    render(:status=>401) and return if char.user_id != current_user.id
    a.affect!
    a.destroy
    char.start_next
    render(:nothing=>true)
  end

end

