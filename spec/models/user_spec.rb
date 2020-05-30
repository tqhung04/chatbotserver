require "rails_helper"

RSpec.describe User, type: :model do
  let(:valid_user){build(:user, email: "abc@gmail.com")}
  let!(:user_1){create(:user, email: "abc_1@gmail.com")}

  describe "validation" do
    it "valid_user is valid" do
      expect(valid_user.valid?).to eq true
    end

    it "the email is not email's format" do
      valid_user.email = "abc"
      expect(valid_user.valid?).to eq false
    end

    it "the email is nill" do
      valid_user.email = nil
      expect(valid_user.valid?).to eq false
    end

    it "the email is not unique" do
      valid_user.email = "abc_1@gmail.com"
      expect(valid_user.valid?).to eq false
    end
  end


  describe "#self.register" do
    it "return without errors" do
      result = User.register(
        "hungtrantgf",
        "hungtrantgf@gmail.com",
        "A1234567--"
      )

      expect(result.success?).to eq true
    end
  end

  describe "#self.login" do
    before do
      User.register(
        "admin",
        "admin@gmail.com",
        "123456"
      )
    end
    it "return false when not found" do
      r = User.login("admin@gmail.com", "654321")
      expect(r.success?).to eq false
    end

    it "return true when found" do
      r = User.login("admin@gmail.com", "123456")
      expect(r.success?).to eq false
    end
  end
end
