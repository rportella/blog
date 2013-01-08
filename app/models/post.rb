class Post < ActiveRecord::Base

  has_and_belongs_to_many :categories, class_name: "PostCategory"
  belongs_to :author, class_name: "User", foreign_key: "author_id"

  attr_accessible :body, :excerpt, :title, :author_id, :category_ids
  validates_presence_of :body, :excerpt, :title
  validates_associated :author
  validates_uniqueness_of :permalink
  validates_inclusion_of :draft, in: [true, false]
  has_many :comments, dependent: :destroy

  def title
    read_attribute(:title).titleize
  end
end
