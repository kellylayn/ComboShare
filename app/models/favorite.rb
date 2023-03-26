class Favorite < ApplicationRecord
  belongs_to :end_user
  belongs_to :article

  validates_uniqueness_of :article_id, scope: :end_user_id
end