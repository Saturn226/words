class Post < ActiveRecord::Base
  belongs_to :author, class: 'User', foreign_key: 'user_id'

  has_many :comments, dependent: :destroy
  has_many :post_tags
  has_many :tags, through: :post_tags


  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true

  accepts_nested_attributes_for :tags
  #, reject_if: proc { |attributes| attributes['name'].blank? }

  def tag_attributes=(tags_attributes)
    tags_attributes.values.each do |attr|
      tag = Tag.find_or_create_by(attr)
      self.tags << tag
    end
  end
end
