class DogsController < ApplicationController

  before_action :ensure_admin, except: [:show]

  def index
    @dogs = Dog.all
  end

  def new
    @dog = Dog.new
  end

  def edit
    @dog = Dog.find(params[:id])
  end

  def update
    @dog = Dog.find(params[:id])
    respond_to do |format|
      if @dog.update(dog_params)
        format.html { redirect_to dogs_path, notice: "Dog updated" }
      else
        format.html { render :edit }
      end
    end
  end

  def create
    @dog = Dog.new(dog_params)

    respond_to do |format|
      if @dog.save
        format.html { redirect_to dogs_path, notice: 'Dog Created' }
        format.js
      else
        format.html { render :new }
        format.js
      end
    end
  end

  def destroy
    @dog = Dog.find(params[:id])

    @dog.destroy
    respond_to do |format|
      format.html { redirect_to dogs_path, notice: "Dog Deleted" }
    end
  end

  def show
    @dog = Dog.find(params[:id])
  end

  private
  def dog_params
    params.require(:dog).permit(:name)
  end

  def ensure_admin
    unless user_signed_in? && current_user.admin?
      redirect_to root_path, notice: "You're not allowed to perform that action."
    end
  end

end