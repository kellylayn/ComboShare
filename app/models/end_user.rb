class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles, dependent: :destroy
  has_many :article_comments,dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorites_articles, through: :favorite, source: :article

  def self.looks(search, word)
    if search == "perfect_match"
      @end_user = EndUser.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @end_user = EndUser.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @end_user = EndUser.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @end_user = EndUser.where("name LIKE?","%#{word}%")
    else
      @end_user = EndUser.all
    end
  end

  def favorited_by?(article_id)
    favorites.where(article_id: article_id).exists?
  end

  def self.guest
    find_or_create_by!(name: 'guestuser' ,email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guestuser"
    end
  end
end
