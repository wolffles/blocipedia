class CollaboratorsController < ApplicationController

  def create
      @collaborator = Collaborator.new(collaborator_params)
      # if @collaborator.save
      #   flash[:notice] = "\"#{@collaborator.user.email}\" has been successfully added.Yay!"
      #   redirect_to Wiki.find_by(params[:collaborator][:wiki_id])
      # else
      #   flash.now[:alert] = "Bummer!There was an error adding the collaborator \"#{@collaborator.user.email}\" :( .Please try again."
      #   redirect_to Wiki.find_by(params[:wiki_id])
      end
    end

  def destroy
    @collaborator = Collaborator.find(params[:id])

    # if @collaborator.destroy
    #   flash[:notice] = "\"#{@collaborator.user.email}\" was successfully removed as collaborator."
    #   redirect_to @collaborator.wiki
    # else
    #   flash[:alert] = "There was an error trying to remove the collaborator \"#{@collaborator.user.email}\".Please try again later."
    #   redirect_to @collaborator.wiki
    # end
  end

private

  def collaborator_params
    params.require(:collaborator).permit(:wiki_id, :user_id)
  end

  def add_collaborator(text, wiki_id)
    invalid, valid = [],[]
    %w(text).each { |email|
      collaborator_id = User.where(email: email).pluck(:id)
      if User.where(email: email).empty?
        invalid << email
      else
        valid << email
        Collaborator.create(user_id: collaborator_id, wiki_id: wiki_id)
      end
    }
  end

  end
