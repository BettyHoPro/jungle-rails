class User < ActiveRecord::Base

  def self.authenticate_with_credentials email, password_digest
    @user = User.find_by_email(email.strip.downcase)
    if @user && @user.authenticate(password_digest)
      @user
    else
      nil
    end
  end

  has_secure_password

  validates :email, presence: true,
                    uniqueness: true
  validates :name, presence: true

end