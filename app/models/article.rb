class Article < ApplicationRecord
  belongs_to :end_user
  has_many :article_comments,dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorites_end_users, through: :favorite, source: :end_user

  validates :title, presence: true
  validates :body, presence: true


  def self.looks(search, word)
    if search == "perfect_match"
      @article = Article.where("title LIKE?", "#{word}")
    elsif search == "forward_match"
      @article = Article.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @article = Article.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @article = Article.where("title LIKE?","%#{word}%")
    else
      @article = Article.all
    end
  end

  def favorited_by?(end_user)
    favorites.exists?(end_user_id: end_user.id)
  end
end
