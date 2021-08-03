class CreateRobots < ActiveRecord::Migration[6.1]
  def change
    create_table :robots do |t|
      t.integer :x
      t.integer :y
      t.string :facing

      t.timestamps
    end
  end
end
