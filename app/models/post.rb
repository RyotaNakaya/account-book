class Post < ApplicationRecord
  belongs_to :category

  validates :amount, presence: {message:"は必須項目です。"}
end
