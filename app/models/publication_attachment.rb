class PublicationAttachment < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :publication
  validates :publication, presence: true
end
