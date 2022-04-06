class AddTypeFieldToAttachments < ActiveRecord::Migration[6.1]
  def change
    add_column :attachments, :type, :string
  end
end
