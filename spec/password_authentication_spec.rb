require File.join(File.dirname(__FILE__), 'spec_helper')


describe Prison::PasswordAuthentication do
  
  before do
    @user = User.new(:email => 'test@example.com', :password => 'test1234', :password_confirmation => 'test1234')
  end
  
  it "should be valid" do
    @user.should be_valid
  end
  
  it "should not be valid without an email address" do
    @user.email = nil
    @user.should have(1).error_on(:email)
  end
  
  it "should not be valid without a password" do
    @user.password = nil
    @user.should have(1).error_on(:password)
  end
  
  it "should not be valid without a password confirmation" do
    @user.password_confirmation = nil
    @user.should have(1).error_on(:password_confirmation)
  end
  
  it "should not be valid if password confirmation doesn't match" do
    @user.password = 'test1234'
    @user.password_confirmation = '1234test'
    @user.should have(1).error_on(:password)
  end
  
end