class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :dictionary
  validates :user_id, uniqueness: { scope: :dictionary_id }
end
