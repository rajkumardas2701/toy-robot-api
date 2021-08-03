class Robot < ApplicationRecord
  validates :x, presence: true
  validates :y, presence: true
  validates :facing, presence: true
  
  def make_move(orient, out)
    case orient
    when "NORTH"
      if out.y == 4
        return "cannot move in this direction"
      else
        return [
                out.x, out.y + 1, out.facing
              ]
      end
    when "SOUTH"
      if out.y == 0
        return "cannot move in this direction"
      else
        return [
                out.x, out.y - 1, out.facing
              ]
      end
    when "EAST"
      if out.x == 4
        return "cannot move in this direction"
      else
        return [
                out.x + 1, out.y, out.facing
              ]
      end
    when "WEST"
      if out.x == 0
        return "cannot move in this direction"
      else
        return [
                out.x - 1, out.y, out.facing
              ]
      end
    else
      "Invalid parameters"
    end
  end

  def check_move(move, orient, out)
    orientation = ["WEST", "NORTH", "EAST", "SOUTH"]
    i = orientation.index(orient)
    m = Robot.first
    case move
    when "LEFT"
      if i == 0
        m.facing = orientation[3]
        m.save
        return [
                out.x, out.y, out.facing = orientation[3]
              ]
      end
      m.facing = orientation[i-1]
      m.save
      [
        out.x, out.y, out.facing = orientation[i-1]
      ]
    when "RIGHT"
      if i == 3
        m.facing = orientation[0]
        m.save
        return [
                out.x, out.y, out.facing = orientation[0]
              ]
      end
      m.facing = orientation[i+1]
      m.save
      [
        out.x, out.y, out.facing = orientation[i+1]
      ]
    when "MOVE"
      out = make_move(orient, out)
      m.x = out[0]
      m.y = out[1]
      m.save
      return out
    else
      return "Invalid parameters"
    end
  end

  def decide_move(params, robo = nil)
    res = params[:commands].split(" ")
    cod = Array.new
    move = ""
    new_facing = ""
    if res.length > 2
      move = params[:commands].split(" ")[2].gsub(/\"/, '').gsub(/]/, '')
      cod = params[:commands].split(" ")[1]
      new_x = cod.split(",")[0].to_i
      new_y = cod.split(",")[1].to_i
      begin
        new_facing = cod.split(",")[2].gsub(/\"/, '')
      rescue NoMethodError
        new_facing = "NORTH"
      end
      if robo == nil
        out = Robot.create(x: new_x,
                      y: new_y,
                      facing: new_facing
        )
      else
        robo.x = new_x
        robo.y = new_y
        robo.facing = new_facing
        robo.save
        out = robo
      end
    else
      move = params[:commands].split(" ")[1].gsub(/\"/, '').gsub(/]/, '')
      cod = params[:commands].split(" ")[0]
      begin
        robo.facing = cod.split(",")[2].gsub(/\"/, '')
      rescue NoMethodError
        new_facing = robo.facing
      end
      out = robo
    end
    return robo == nil ? "you didn't place Robot on the table yet. Use PLACE keyword"
                       : check_move(move, new_facing, out)
  end
end
