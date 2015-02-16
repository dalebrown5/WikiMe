class CollaboratorsController < ApplicationController
  before_action :set_wiki

  def index
    @users = User.all
    @users.delete(current_user)
  end

  # def update
  #   @wiki = Wiki.find(params[:wiki_id])  
  #   @collaborator = @wiki.collaborators.find(params[:id])
  #   redirect_to collaborators_path
  # end

  def create 
    @collaborator = @wiki.collaborators.build(user_id: params[:user_id])

    if @collaborator.save
      flash[:notice] = "Saved!"
    else
      flash[:error] = "Not saved"
    end

    redirect_to wiki_collaborators_path(@wiki)
  end

  def destroy
    @collaborator = Collaborator.find(params[:id])
    if @collaborator.destroy
     flash[:notice] = "Destroyed!"
    else
      flash[:error] = "Not destroyed"
    end

    redirect_to wiki_collaborators_path(@wiki)
  end

  private

  def collaborator_params
    params.require(:collaborator).permit(:wiki_id, :user_id)
  end

  def set_wiki
     @wiki = Wiki.find(params[:wiki_id])  
  end
end
