class Attachment < ApplicationRecord
    mount_uploader :file, FileUploader
    belongs_to :user
    has_many :share, through: :user
end
