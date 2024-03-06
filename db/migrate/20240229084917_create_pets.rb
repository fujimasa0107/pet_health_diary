class CreatePets < ActiveRecord::Migration[7.0]
  def change
    create_table :pets do |t|
      t.references :user, null: false, foreign_key: true  # user_id を外部キーとして参照
      t.string :name,     null: false  # ペットの名前
      t.integer :age,     null: false  # ペットの年齢
      t.decimal :weight,  null: true  # ペットの体重
      t.timestamps
    end
  end
end
