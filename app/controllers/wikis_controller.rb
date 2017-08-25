class WikisController < ApplicationController
  after_action :verify_authorized

  def index
    @wikis = Wiki.all
    authorize Wiki
  end

  def create
    @wiki_page = Wiki.new
    @wiki_page.title = params[:wiki][:title]
    @wiki_page.body = params[:wiki][:body]
    @wiki_page.user = current_user
    authorize @wiki_page
    if @wiki_page.save
      flash[:notice] = "Post was saved."
      redirect_to @wiki_page
    else
      flash.now[:alert] = "There was an error saving. Please try again"
      render :new
    end
  end

  def new
    @wiki_page = Wiki.new
    authorize Wiki
  end

  def edit
    @wiki_page = Wiki.find(params[:id])
    authorize @wiki_page
  end

  def update
    @wiki_page = Wiki.find(params[:id])
    @wiki_page.assign_attributes(wiki_params)
    authorize @wiki_page
    if @wiki_page.save
      flash[:notice] = "Post was updated."
      redirect_to [@wiki_page]
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
    end
  end

  def show
    @wiki_page = Wiki.find(params[:id])
    authorize @wiki_page
  end

  def destroy
    @wiki_page = Wiki.find(params[:id])
    authorize @wiki_page
    if @wiki_page.destroy
      flash[:notice] = "\"#{@wiki_page.title}\" was deleted successfully."
      redirect_to wikis_path
    else
      flash.now[:alert] = "There was an error deleting the post."
      render :show
    end
  end

  private

  #method that white lists (allows privilege for) the parameters we need to create comments.
  def wiki_params
    params.require(:wiki).permit(:title, :body)
  end

end
