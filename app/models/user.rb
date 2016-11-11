class User < ActiveRecord::Base

   has_many :event_as_host
   has_many :invites
   has_many :event_as_guest, through: :invites

   validates :first_name, presence: { message: "must be given please" }
   validates :last_name, presence: {message: "not be blank"}
    validates :user_name, presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
end
