require "spec_helper"

describe User do
  subject(:user) { FactoryGirl.create(:user) }

  it { should_not raise_error }

  context "validations" do
    it "rejects users without an email" do
      User.new.should have(1).error_on(:email)
    end
    it "rejects users without a password" do
      User.new.should have(1).error_on(:password)
    end
    it "rejects duplicate emails" do
      FactoryGirl.create(:user, :email => "test@example.com")
      User.new(email: "test@example.com").should have(1).error_on(:email)
    end
  end
end
