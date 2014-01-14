class User < ActiveRecord::Base
  before_save { self.email = email.downcase } #emailת����ȫСд��ʽ,ȷ��Ψһ��

  validates :name, presence: true, length: {maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i  #��֤email��ʽ

  validates :email, presence: true, 
  		  format: { with: VALID_EMAIL_REGEX },
		  uniqueness: {case_sensitive: false } #��֤emailΨһ��.

  has_secure_password

  validates :password, length: { minimum: 6 }

end
