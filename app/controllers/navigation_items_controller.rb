class NavigationItemsController < ApplicationController

  before_action :ensure_admin

  def index
  	@navigation_items = NavigationItem.all 
  end

  def new
     @navigation_item = NavigationItem.new
  end

  def edit
    @navigation_item = NavigationItem.find(params[:id])
  end

  def update
    @navigation_item = NavigationItem.find(params[:id])

    respond_to do |format|
      if @navigation_item.update(navigation_item_params)
        format.html { redirect_to navigation_items_path, notice: "Navigation item updated" }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @navigation_item = NavigationItem.find(params[:id])

    @navigation_item.destroy
    respond_to do |format|
      format.html { redirect_to navigation_items_path, notice: "Navigation Item Deleted" }
    end
  end

  def create
    @navigation_item = NavigationItem.new(navigation_item_params)

    respond_to do |format|
      if @navigation_item.save
        format.html { redirect_to navigation_items_path, notice: 'Navigation Item Created' }
        format.js
      else
        format.html { render :new }
        format.js
      end
    end
  end

  private
  def navigation_item_params
    params.require(:navigation_item).permit(:title, :list_order)
  end

  def ensure_admin
    unless user_signed_in? && current_user.admin?
      redirect_to root_path, notice: "You're not allowed to perform that action."
    end
  end

end


