class Article < ApplicationRecord
  belongs_to :end_user
  has_many :article_comments,dependent: :destroy

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
end
