class CollaboratorsController < ApplicationController
  before_action :authenticate_user!

  def create
    emails_string = collaborator_params[:id]
    wiki_id = collaborator_params[:wiki_id]
    invalid, valid = Collaborator.import(emails_string, wiki_id)
    flash[:alert] = "There was an error trying to add \"#{invalid.join(' , ')}\". Did you spell it right?"
    flash[:notice] = "\"#{valid.join(' , ')}\" has been added."
    redirect_to edit_wiki_path(wiki_id)
    # im not going to bother with doing multiple flash messages atm
    # also if Future me has time make the redirect_to a version that has the invalid emails for easy update
  end

  def destroy
    @collaborator = Collaborator.find(params[:id])

    if @collaborator.destroy
      flash[:notice] = "\"#{User.find(@collaborator.user_id).email}\" was successfully removed as collaborator."
      redirect_to @collaborator.wiki
    else
      flash[:alert] = "There was an error trying to remove the collaborator \"#{@collaborator.user.email}\".Please try again later."
      redirect_to @collaborator.wiki
    end
  end

private

  def collaborator_params
    params.require(:collaborator).permit(:wiki_id, :user_id, :id)
  end

  end
