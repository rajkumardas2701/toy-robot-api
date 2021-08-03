class Api::RobotsController < ApplicationController
  before_action :set_robot
  def create

  end

  def update
    rb = Robot.new
    if @robot
      robot_params
      # byebug
      # rb.check_move(robot_params)
      render json: {
        location: [Robot.first.x, Robot.first.y, Robot.first.facing]
      }
    else
      # rb.create_robot(robot_params)
      render json: {
        location: rb.create_robot(robot_params)
      }
    end
  end

  def set_robot
    @robot = Robot.first
  end

  def robot_params
    params.permit(:commands)
  end
end
