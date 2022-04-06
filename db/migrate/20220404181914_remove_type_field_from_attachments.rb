class RemoveTypeFieldFromAttachments < ActiveRecord::Migration[6.1]
  def change
    remove_column :attachments, :type, :string
  end
end
