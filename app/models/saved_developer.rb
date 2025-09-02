class SavedDeveloper < ApplicationRecord
  belongs_to :user
  belongs_to :developer

  validates :user_id, uniqueness: { scope: :developer_id }

  index [:user_id, :developer_id], unique: true
end
