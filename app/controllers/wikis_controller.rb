class WikisController < ApplicationController
  before_action :set_wiki, only: [:show, :edit, :update, :destroy]

  def index
    #@wikis = Wiki.all
    @wikis = policy_scope(Wiki)
  end
  
  def show
  end
  
  def new
    @wiki = Wiki.new
    authorize @wiki
  end
 
  def edit
    authorize @wiki
  end

  def create
    @wiki = current_user.wikis.build(wiki_params)
    @wiki.private ||= false
    authorize @wiki

    respond_to do |format|
      if @wiki.save
        format.html { redirect_to wikis_path, notice: 'Wiki was successfully created.' }
        format.json { render :show, status: :created, location: @wiki }        
      else
        format.html { render :new }
        format.json { render json: @wiki.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @wiki
    respond_to do |format|
      if @wiki.update(wiki_params)
        format.html { redirect_to wikis_path, notice: 'Wiki was successfully updated.' }
        format.json { render :show, status: :ok, location: @wiki }
      else
        format.html { render :edit }
        format.json { render json: @wiki.errors, status: :unprocessable_entity }
      end
    end
  end
 
  def destroy
    authorize @wiki
    @wiki.destroy
    respond_to do |format|
      format.html { redirect_to wikis_url, notice: 'Wiki was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
   
    def set_wiki
      @wiki = Wiki.find(params[:id])
    end

    def wiki_params
      params.require(:wiki).permit(:title, :body, :private, :user_id)
    end
end
