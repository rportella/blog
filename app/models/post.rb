class Post < ActiveRecord::Base
  attr_accessible :body, :excerpt, :title
  validates_presence_of :body, :excerpt, :title
  has_many :comments, :dependent => :destroy

  def title
    read_attribute(:title).titleize
  end
end
