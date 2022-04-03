class CreateShares < ActiveRecord::Migration[6.1]
  def change
    create_table :shares do |t|
      t.integer :sharedBy
      t.integer :user_id
      t.integer :attachment_id

      t.timestamps
    end
  end
end
