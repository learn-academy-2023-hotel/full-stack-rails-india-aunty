class CreateComedies < ActiveRecord::Migration[7.0]
  def change
    create_table :comedies do |t|
      t.string :joke
      t.string :punch_line

      t.timestamps
    end
  end
end
