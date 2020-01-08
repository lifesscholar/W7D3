require 'rails_helper'

# ::find_by_credentials
# password=(password)
# reset_session_token!

RSpec.describe User, type: :model do
subject(:user) { FactoryBot.create(:user) }

  # pending "add some examples to (or delete) #{__FILE__}"
  it { should validate_presence_of(:email) } 
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_uniqueness_of(:session_token) }
  it { should validate_length_of(:password).is_at_least(6) } 

  # def self.find_by_credentials(email, password)
  #   user = User.find(email: email)
  #   return nil if user.nil?
  #   user.is_password?(password) ? user : nil
  # end
  describe "::find_by_credentials(email, password)" do

    it "should find the correct user based on the credentials" do
      expect(User.find_by_credentials(user.email, user.password)).to eq(user)
    end

      
    it "nil if user does not exist" do
      expect(User.find_by_credentials(nil, user.password)).to eq(nil)
      expect(User.find_by_credentials(user.email, nil)).to eq(nil)
    end
  end

  # def password=(password)
  #   @password = password
  #   self.password_digest = BCrypt::Password.create(password)
  # end

  describe "#password=(password)" do
    it "should set password_digest to BCrypt version of password" do
      expect(user.password_digest.length).to eq(60)
    end
  end

  # def reset_session_token!
  #   self.session_token = User.generate_session_token
  #   self.save!
  #   self.session_token
  # end

  describe "#reset_session_token!" do
    let!(:old_session_token) { user.session_token }
    it "should reset the session token" do
      expect(user.reset_session_token!).to_not eq(old_session_token)
    end
  end


end
