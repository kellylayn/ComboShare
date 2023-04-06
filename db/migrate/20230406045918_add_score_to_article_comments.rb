class AddScoreToArticleComments < ActiveRecord::Migration[6.1]
  def change
    add_column :article_comments, :score, :decimal, precision: 5, scale: 3
  end
end
