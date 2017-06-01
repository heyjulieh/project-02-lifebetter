class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  # username is not case sensitive
  validates :username, :presence=>true, :uniqueness=>{:case_sensitive=>false}

  has_many :tips, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable#,:lockable ,:confirmable

  def email_required?
   false
  end

  def email_changed?
   false
  end

end
