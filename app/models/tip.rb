class Tip < ApplicationRecord
  belongs_to :user, optional: true
  acts_as_votable
  has_attached_file :avatar, styles: { medium: "300x300#", thumb: "100x100#" }, default_url: "tip.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  extend FriendlyId
  friendly_id :title, use: [:finders, :slugged]

end
