class CreateTrademarks < ActiveRecord::Migration
  def change
    create_table :trademarks do |t|
      t.string :title

      t.string   :title_image_file_name
      t.string   :title_image_content_type
      t.integer  :title_image_file_size
      t.datetime :title_image_updated_at

      t.string   :title_mixed_file_name
      t.string   :title_mixed_content_type
      t.integer  :title_mixed_file_size
      t.datetime :title_mixed_updated_at

      t.boolean :research
      t.string :research_Limit
      t.string :registration_limit
      t.text :service
      t.string :mktu
      t.text :comments
      t.string :name
      t.text :requisites

      t.string   :requisites_file_file_name
      t.string   :requisites_file_content_type
      t.integer  :requisites_file_file_size
      t.datetime :requisites_file_updated_at

      t.string :email
      t.string :phone
      t.string :contact

      t.timestamps
    end
  end
end
