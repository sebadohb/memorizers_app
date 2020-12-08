class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, length: { maximum: 10 }
  validates :email, uniqueness: { case_sensitive: true }
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i,
                                 message: 'Include both letters and numbers' }

  has_many :dictionaries, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_dictionaries, through: :bookmarks, source: :dictionary
  has_many :comments, dependent: :destroy

  def already_bookmarked?(dictionary)
    self.bookmarks.exists?(dictionary_id: dictionary.id)
  end
end
