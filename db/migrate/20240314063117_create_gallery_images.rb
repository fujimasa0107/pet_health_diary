class CreateGalleryImages < ActiveRecord::Migration[7.0]
  def change
    create_table :gallery_images do |t|
      t.references :user, null: false, foreign_key: true
      t.references :daily_log, null: false, foreign_key: true
      t.date :date
      t.timestamps
    end
  end
end