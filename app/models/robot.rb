class Robot < ApplicationRecord
  validates :x, presence: true
  validates :y, presence: true
  validates :facing, presence: true

  # orientation = ['WEST', 'NORTH', 'EAST', 'SOUTH']
  # orientation = ["WEST", "NORTH", "EAST", "SOUTH"]
  
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
    # byebug
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
      m.save
      return out
    else
      return "Invalid parameters"
    end
  end

  def create_robot(params)
    res = params[:commands].split(" ")
    cod = params[:commands].split(" ")[1]
    # move = params[:commands].split(" ")[2].gsub(/\"/, '').gsub(/]/, '')
    # byebug
    if res.length > 2
      move = params[:commands].split(" ")[2].gsub(/\"/, '').gsub(/]/, '')
      out = Robot.create(x: cod.split(",")[0].to_i,
                    y: cod.split(",")[1].to_i,
                    facing: cod.split(",")[2].gsub(/\"/, '')
      )
      # byebug
      return out = check_move(move, cod.split(",")[2].gsub(/\"/, ''), out)
      # return out
      # byebug
    end
    return "you didn't place Robot on the table yet. Use PLACE keyword"
  end
end

# params[:commands].split(" ")[1].split(",")[2].include?("North")
