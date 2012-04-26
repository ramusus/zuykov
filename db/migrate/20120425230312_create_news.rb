class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.text :content
      t.date :date
      t.integer :type

      t.timestamps
    end
  end
end
