class User < ActiveRecord::Base
  before_save { self.email = email.downcase } #email转换成全小写形式,确保唯一性

  validates :name, presence: true, length: {maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i  #验证email格式

  validates :email, presence: true, 
  		  format: { with: VALID_EMAIL_REGEX },
		  uniqueness: {case_sensitive: false } #验证email唯一性.

  has_secure_password

  validates :password, length: { minimum: 6 }

end
