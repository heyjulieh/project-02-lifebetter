class User < ApplicationRecord
  has_many :tips, dependent: :destroy
  has_attached_file :avatar, styles: { medium: "300x300#", thumb: "100x100#" }, default_url: "profile.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  # username is not case sensitive
  validates :username, :presence=>true, :uniqueness=>{:case_sensitive=>false}


  devise :database_authenticatable, :registerable,

         :recoverable, :rememberable, :trackable, :validatable#,:lockable ,:confirmable

  def email_required?
   false
  end

  def email_changed?
   false
  end
end
