class CreatePostOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :post_options do |t|
      t.references :post, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
