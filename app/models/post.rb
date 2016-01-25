class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true

  belongs_to :author, class: 'User', foreign_key: 'user_id'
end
