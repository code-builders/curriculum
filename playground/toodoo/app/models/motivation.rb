class Motivation

  def tweets
    client.search("-filter:retweets #motivational")
  end

  def client
    Twitter::REST::Client.new do |config|
      config.consumer_key        = "y1wWzZU7Rp4IpzyDVmL09R6ig"
      config.consumer_secret     = "vuCrjRNWbtJ89cmv2Bvw4TTaxN5BRQho3Ob8oTvKQCO0MpNnbV"
      config.access_token        = "8553052-BEPqVExFTSRTGlvJU87SF2MCj4U8KhIAbNAn1SZgcr"
      config.access_token_secret = "yV8ON4ddQ37L3lHouR79wMxlbP82LvRaGG47TO1xLL2De"
    end
  end

end
