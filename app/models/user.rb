class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :cpf, presence: true
  validates :email, presence: true 
                    format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email" },
                    uniqueness: { case_sensitive: false }
  validates :has_secure_password, presence: true, uniquess: true

end
