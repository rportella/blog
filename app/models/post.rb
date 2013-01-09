class Post < ActiveRecord::Base

  has_and_belongs_to_many :categories, class_name: "PostCategory"
  belongs_to :author, class_name: "User", foreign_key: "author_id"

  attr_accessible :body, :excerpt, :title, :author_id, :category_ids, :slug, :draft, :published_at
  validates_presence_of :body, :excerpt, :title
  validates_associated :author
  validates_uniqueness_of :slug
  validates_inclusion_of :draft, in: [true, false]
  has_many :comments, dependent: :destroy

  def title
    read_attribute(:title).titleize
  end
  scope :published, lambda {where("draft = ? AND published_at < ?", false, Time.current)}
  scope :search, lambda {|terms| where("title LIKE :t OR body LIKE :t", t: "#{terms}")}

  before_validation :genarate_slug

  def to_param
    "#{id}-#{slug}"
  end

protected
  def genarate_slug
    self.slug ||= title
    self.slug = slug.parameterize
  end

end
