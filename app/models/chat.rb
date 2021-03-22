class Chat < ApplicationRecord
  belongs_to :flag
  belongs_to :user
end
