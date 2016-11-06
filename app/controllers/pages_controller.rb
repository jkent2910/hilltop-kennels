class PagesController < ApplicationController
  def index
  	@pages = Page.all 
  end

  def new
     @page = Page.new
  end

  def create
    @page = Page.new(page_params)

    respond_to do |format|
      if @page.save
        format.html { redirect_to pages_path, notice: 'Page Created' }
        format.js
      else
        format.html { render :new }
        format.js
      end
    end
  end

  def show
       @page = Page.find(params[:id])
  end 

  private
  def page_params
    params.require(:page).permit(:title, :body, :navigation_item_id)
  end

end