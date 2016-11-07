class PagesController < ApplicationController

  before_action :ensure_admin

  def index
  	@pages = Page.all 
  end

  def new
     @page = Page.new
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to pages_path, notice: "Page updated" }
      else
        format.html { render :edit }
      end
    end
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

  def destroy
    @page = Page.find(params[:id])

    @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_path, notice: "Page Deleted" }
    end
  end

  def show
    @page = Page.find(params[:id])
  end 

  private
  def page_params
    params.require(:page).permit(:title, :body, :navigation_item_id)
  end

  def ensure_admin
    unless user_signed_in? && current_user.admin?
      redirect_to root_path, notice: "You're not allowed to perform that action."
    end
  end

end