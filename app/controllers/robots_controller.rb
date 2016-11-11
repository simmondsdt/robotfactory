class RobotsController < ApplicationController
  before_action :set_inventor
  before_action :set_robot, except: [:index, :new, :create]

  def show
    @parts = @robot.parts
  end

  def new
    @robot = @inventor.robots.new
  end

  def create
    @robot = @inventor.robots.new(robot_params)
    if @robot.save
      redirect_to inventor_robot_path(@inventor, @robot)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @robot.update(robot_params)
      redirect_to inventor_robot_path(@inventor, @robot)
    else
      render :edit
    end
  end

  def destroy
    @robot.destroy
    redirect_to inventor_path(@inventor)
  end

  private
    def robot_params
      params.require(:robot).permit(:name, :serial_number, :evil,
                                        :color, :industry)
    end

    def set_inventor
      @inventor = Inventor.find(params[:inventor_id])
    end

    def set_robot
      @robot = @inventor.robots.find(params[:id])
    end
end
