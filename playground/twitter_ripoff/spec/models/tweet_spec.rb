require 'rails_helper'

RSpec.describe Tweet, type: :model do
  let(:tweet) { Tweet.new(body: "a" * 140, user_id: 1) }

  describe "validations" do
    it "ensures that the body is not nil" do
      tweet.body = nil
      expect(tweet.valid?).to eq false
    end

    it "is invalid with a body of 141 chars" do
      tweet.body = "a" * 141
      expect(tweet.valid?).to eq false
    end

    it "is valid with a body of 140 chars" do
      expect(tweet.valid?).to eq true
    end

    it "is invalid when user_id is nil" do
      tweet.user_id = nil
      expect(tweet.valid?).to eq false
    end
  end

  describe "character_count" do
    it "returns the length of the body" do
      tweet.body = "a" * 90
      expect(tweet.character_count).to eq 90
    end

    it "return the length of a short body" do
      tweet.body = "a"
      expect(tweet.character_count).to eq 1
    end
  end

end
