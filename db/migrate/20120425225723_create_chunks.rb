class CreateChunks < ActiveRecord::Migration
  def change
    create_table :chunks do |t|
      t.string :title
      t.string :code
      t.text :content

      t.timestamps
    end
  end
end
