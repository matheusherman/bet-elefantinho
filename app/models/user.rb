class User < ApplicationRecord

  # :confirmable, :lockable, :timeoutable, :trackable, :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { user: 0, admin: 1 } # define perfis de usuário


  validates :name, presence: true, length: { maximum: 100 }
  validates :cpf, presence: true, uniqueness: true, length: { is: 11 } 
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email" }


  validates :password, presence: true, length: { minimum: 6 }, if: :password_required?
  before_save :downcase_email

  private

  def downcase_email
    self.email = email.downcase
  end

  def password_required?
    # Valida senha apenas se for criar novo usuário ou alterar senha
    new_record? || password.present?
  end
end

