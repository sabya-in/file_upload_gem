class AddSharedByFieldToAttachments < ActiveRecord::Migration[6.1]
  def change
    add_column :attachments, :sharedBy, :string
  end
end
