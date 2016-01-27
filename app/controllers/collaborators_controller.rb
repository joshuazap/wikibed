class CollaboratorsController < ApplicationController
  before_action :set_wiki
  def index
    @users = User.all
  end

  def create
    @collaborator = @wiki.collaborators.new(user_id: params[:user_id])

    if @collaborator.save
      flash[:notice] = "Collaborator was added."
    else
      flash[:error] = "There was a problem adding the collaborator. Try again."
    end

    redirect_to wiki_collaborators_path(@wiki)
  end

  def destroy
    @collaborator = Collaborator.find(params[:id])

    if @collaborator.destroy
      flash[:notice] = "Collaborator was removed."
    else
      flash[:error] = "There was a problem removing the collaborator. Try again."
    end

    redirect_to wiki_collaborators_path(@wiki)
  end

  private
  def set_wiki # Sets the wiki in context
    @wiki = Wiki.find(params[:wiki_id])
  end
end
