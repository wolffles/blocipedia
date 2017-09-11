class CollaboratorsController < ApplicationController

  def new
    @emails_strings = collaborator_params[:id]
    @array_emails = @emails_strings.split
  end

  def create
    @emails_string = collaborator_params[:id]
    @array_emails = @emails_strings.split
    flash.now[:alert]= "these are your #{@emails_string}"
     @invalid, @valid = [], []
     @array_emails.each{ |email|
       collaborator_id = User.where(email: email).pluck(:id)
       if collaborator_id.empty?
         flash.now[:alert] = "Bummer! There was an error adding the collaborator \"#{email}\" :( .Please try again."
       else
         @collaborator = Collaborator.create(user_id: collaborator_id, wiki_id: wiki_id)
         if @collaborator.save
           flash[:notice] = "\"#{@collaborator.user.email}\" has been successfully added.Yay!"
         else
           flash.now[:alert] = "Bummer!There was an error adding the collaborator \"#{@collaborator.user.email}\" :( .Please try again."
         end
       end
     }
  end

  def destroy
    @collaborator = Collaborator.find(params[:id])

    if @collaborator.destroy
      flash[:notice] = "\"#{@collaborator.user.email}\" was successfully removed as collaborator."
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
