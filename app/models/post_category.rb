class PostCategory < ActiveRecord::Base
  attr_accessible :name
  validates_presence_of :name

  has_and_belongs_to_many :posts
end
