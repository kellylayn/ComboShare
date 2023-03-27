class ArticleComment < ApplicationRecord
  belongs_to :end_user
  belongs_to :article

  validates :comment, presence: true
end
