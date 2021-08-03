class Robot < ApplicationRecord
  validates :x, presence: true
  validates :y, presence: true
  validates :facing, presence: true

  def check_move
  end
  
  def create_robot(params)
    res = params[:commands].split(" ")
    cod = params[:commands].split(" ")[1]
    # byebug
    if res.length > 2
      out = Robot.create(x: cod.split(",")[0].to_i,
                    y: cod.split(",")[1].to_i,
                    facing: cod.split(",")[2].gsub!(/\"/, '')
      )
      return [out.x, out.y, out.facing]
      # byebug
    end
    return "you didn't place Robot on the table yet. Use PLACE keyword"
  end
end

# params[:commands].split(" ")[1].split(",")[2].include?("North")
