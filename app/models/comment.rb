class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :dictionary
  validates :content, presence: true
end
