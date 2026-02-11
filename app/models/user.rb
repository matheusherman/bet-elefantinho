class User < ApplicationRecord
<<<<<<< HEAD
=======

  include CpfValidatable
>>>>>>> 544aca5b57da0a438451da017d22ccc0c7e30485
  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Enum de perfis
  enum :role, { user: 0, admin: 1 }

  # Validações
  validates :name, presence: true, length: { maximum: 100 }
  validates :cpf, presence: true, uniqueness: true, length: { is: 11 }
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email" }

  validates :password, presence: true, length: { minimum: 6 }, if: :password_required?

  # Callbacks
  before_save :downcase_email

  private

  def downcase_email
    self.email = email.downcase
  end

  def password_required?
    new_record? || password.present?
  end
end
