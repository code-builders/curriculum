require 'rails_helper'

RSpec.describe Tweet, type: :model do
  describe "validations" do
    it "ensures that the body is not nil" do
      expect(Tweet.new.valid?).to eq false
    end

    it "is invalid with a body of 141 chars" do
      expect(Tweet.new(body: "a" * 141).valid?).to eq false
    end

    it "is valid with a body of 140 chars" do
      expect(Tweet.new(body: "a" * 140).valid?).to eq true
    end
  end
end
