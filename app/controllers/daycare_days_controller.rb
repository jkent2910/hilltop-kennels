class DaycareDaysController < ApplicationController

  before_action :ensure_admin

  def new
    @daycare_day = DaycareDay.new
    @dogs = Dog.all
  end

  def edit
    @daycare_day = DaycareDay.find(params[:id])
  end

  def update
    @daycare_day = DaycareDay.find(params[:id])
    respond_to do |format|
      if @daycare_day.update(daycare_day_params)
        format.html { redirect_to dogs_path, notice: "Dog(s) updated!" }
      else
        format.html { render :edit }
      end
    end
  end

  def create
    @daycare_day = DaycareDay.new(daycare_day_params)

    @daycare_day.start_time = params[:start_time]
    @daycare_day.end_time = params[:end_time]
    respond_to do |format|
      if @daycare_day.save
        format.html { redirect_to dogs_path, notice: 'Dog(s) added!' }
        format.js
      else
        format.html { render :new }
        format.js
      end
    end
  end

  def destroy
    @daycare_day = DaycareDay.find(params[:id])

    @daycare_day.destroy
    respond_to do |format|
      format.html { redirect_to dogs_path, notice: "Dog Deleted" }
    end
  end

  def show
    @daycare_day = DaycareDay.find(params[:id])
  end

  def remove_dog
    @daycare_day = DaycareDay.find(params[:daycare_day_id])
    @daycare_day.dogs.destroy(params[:dog_id])
    redirect_to dogs_path, notice: "Dog removed"
  end

  private
  def daycare_day_params
    params.require(:daycare_day).permit(:start_time, :end_time, dog_ids: [])
  end

  def ensure_admin
    unless user_signed_in? && current_user.admin?
      redirect_to root_path, notice: "You're not allowed to perform that action."
    end
  end

end