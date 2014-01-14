require 'spec_helper'

describe User do
  before {@user = User.new(name: "Example User",
  			email: "user@example.com",
			password: "foobar",
			password_confirmation: "foobar")}
  
  subject {@user}
  
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should be_valid }
  
end
