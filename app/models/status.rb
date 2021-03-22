class Status < ApplicationRecord
  with_options presence: true do
    validates :name
  end
end
