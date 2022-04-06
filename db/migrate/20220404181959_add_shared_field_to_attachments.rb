class AddSharedFieldToAttachments < ActiveRecord::Migration[6.1]
  def change
    add_column :attachments, :shared, :string
  end
end
