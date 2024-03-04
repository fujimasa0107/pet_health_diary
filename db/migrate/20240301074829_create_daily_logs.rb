class CreateDailyLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :daily_logs do |t|
      t.references :user,          null: false, foreign_key: true
      t.references :pet,           null: false, foreign_key: true
      t.date       :date,          null:false
      t.integer    :food_intake,   null:false
      t.integer    :water_intake,  null:false
      t.integer    :toilet_count,  null:false
      t.integer    :exercise_time, null:false
      t.string     :image
      t.timestamps
    end
  end
end
