class AddForeignKeyForAttachmentToShares < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :shares, :attachments
  end
end
