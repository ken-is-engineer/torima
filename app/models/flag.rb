class Flag < ApplicationRecord
  with_options presence: true do
    validates :status
    validates :start_time
  end

  has_many :chats
  belongs_to :user
end
