class Post < ActiveRecord::Base
  belongs_to :author, class: 'User', foreign_key: 'user_id'

  has_many :comments, dependent: :destroy
  has_many :post_tags
  has_many :tags, through: :post_tags


  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true

  def tag_ids=(ids)
    ids.each do |id|
      if !id.empty?
        selected_tag = Tag.find(id)
        self.tags << selected_tag unless self.tags.include? selected_tag
      end
    end
  end

  def tags_attributes=(tag_attributes)
    tag = Tag.find_or_create_by(tag_attributes)
    self.tags << tag unless self.tags.include? tag
  end

end
