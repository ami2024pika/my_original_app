class CreateVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :votes do |t|
      t.references :post, foreign_key: true
      t.references :post_option, foreign_key: true
      t.string :session_id

      t.timestamps
    end
  end
end
