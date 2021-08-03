class Api::RobotsController < ApplicationController
  before_action :set_robot
  def create

  end

  def update
    rb = Robot.new
    if @robot
      rb.decide_move(robot_params, @robot)
      render json: {
        location: rb.decide_move(robot_params, @robot)
        # [Robot.first.x, Robot.first.y, Robot.first.facing]
      }
    else
      render json: {
        location: rb.decide_move(robot_params)
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
