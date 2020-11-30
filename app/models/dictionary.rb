class Dictionary < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :word, :meaning, :definition, :pronunciation, presence: true
  with_options numericality: { other_than: 1, message: 'must be selected'} do
    validates :speech_id
    validates :level_id
  end

  belongs_to :user
  belongs_to_active_hash :speech
  belongs_to_active_hash :level
  has_one_attached :image
end
