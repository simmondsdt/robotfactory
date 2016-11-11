class InventorsController < ApplicationController
  before_action :set_inventor, except: [:index, :new, :create]

  def index
    @inventor = Inventor.all
  end

  def show
    @robots = @inventor.robots
  end

  def new
    @inventor = Inventor.new
  end

  def create
    params[:inventor][:hire_date] = Date.today
    @inventor = Inventor.new(inventor_params)
    if @inventor.save
      redirect_to inventor_path(@inventor)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @inventor.update(inventor_params)
      redirect_to inventor_path(@inventor)
    else
      render :edit
    end
  end

  def destroy
    @inventor.destroy
    redirect_to inventors_path
  end

  private
    def inventor_params
      params.require(:inventor).permit(
        :name, :age, :hire_date, :speciality
      )
    end

    def set_inventor
      @inventor = Inventor.find(params[:id])
    end
end
