class Post < ActiveRecord::Base
  belongs_to :author, class: 'User', foreign_key: 'user_id'

  has_many :comments, dependent: :destroy
  has_many :post_tag
  has_many :tags, through: :post_tags

  
  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true


end
