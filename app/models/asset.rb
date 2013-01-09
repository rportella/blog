class Asset < ActiveRecord::Base
  attr_accessible :description, :title, :document

  validates_presence_of :title

  has_attached_file :document, :styles => { :medium => "300x300#", :thumb => "50x50#" }

  validates_attachment_presence     :document
  validates_attachment_size         :document, :less_than => 5.megabyte
  validates_attachment_content_type :document, :content_type => %w(image/png image/jpeg image/gif image/tiff)

end
