class Dictionary < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :word, :meaning, :definition, :pronunciation, :image,  presence: true
  with_options numericality: { other_than: 1, message: 'must be selected'} do
    validates :speech_id
    validates :level_id
  end

  belongs_to :user
  belongs_to_active_hash :speech
  belongs_to_active_hash :level
  has_one_attached :image
  has_many :bookmarks, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  def bookmark_by?(user)
    bookmarks.where(user_id: user.id).exists?
  end
  
end
