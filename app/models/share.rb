class Share < ApplicationRecord
    belongs_to :user
    belongs_to :attachment
end
