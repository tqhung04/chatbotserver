require "rails_helper"

RSpec.describe SessionStorage do
  describe "set/get" do
    it "return nil when not found" do
      r = SessionStorage.get("some-key")
      expect(r.success?).to eq true
      expect(r.data).to eq nil
    end

    it "return data when found" do
      SessionStorage.set("some-key", "some-value")
      r = SessionStorage.get("some-key")
      expect(r.success?).to eq true
      expect(r.data).to eq "some-value"
    end
  end

  describe "rm" do
    it "remove data" do
      SessionStorage.set("some-key", "some-value")
      SessionStorage.rm("some-key")
      r = SessionStorage.get("some-key")
      expect(r.data).to eq nil
    end
  end
end
