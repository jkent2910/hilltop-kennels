class NavigationItemsController < ApplicationController
  def index
  	@navigation_items = NavigationItem.all 
  end

  def new
     @navigation_item = NavigationItem.new
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

end


