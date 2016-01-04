class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :message
      t.belongs_to :user
      t.date :date
      t.boolean :remind
      t.timestamps null: false
    end
  end
end
