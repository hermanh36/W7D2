class User < ApplicationRecord

  validates :email, :password_digest, :session_token, presence: true
  validates :session_token, :email, uniqueness: true
  validates :password, length: {minimum: 6, allow_nil: true}, presence: true
  

  after_initialize :ensure_session_token
  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end

  def password
    @password
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    pass_obj = BCrypt::Password.new(self.password_digest)
    pass_obj.is_password?(password)
  end

  def self.find_by_credentials(email,password)
    @user = User.find_by(email: email)
    if @user && @user.is_password?(password)
      return @user
    end
    return nil
  end


end