class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles, dependent: :destroy

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
end
