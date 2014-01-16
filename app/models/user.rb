class User < ActiveRecord::Base
  
  has_many :microposts, dependent: :destroy # user A micropost relations

  before_save { self.email = email.downcase } #email转换成全小写形式,确保唯一性
  before_create :create_remember_token
  
  validates :name, presence: true, length: {maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i  #验证email格式

  validates :email, presence: true, 
  		  format: { with: VALID_EMAIL_REGEX },
		  uniqueness: {case_sensitive: false } #验证email唯一性.

  has_secure_password

  validates :password, length: { minimum: 6 }

  def User.new_remember_token
   SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
   Digest::SHA1.hexdigest(token.to_s)
  end

  def User.admin?
   return User.admin
  end

  def feed
   # This is preliminary. See "following users" for the full implementation
   Micropost.where("user_id=?", id)
  end

  private

   
   def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
   end

end
