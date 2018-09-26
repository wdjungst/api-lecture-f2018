class TwitterClient
  def self.timeline
    client.home_timeline
  end

  def self.by_user(term)
    tweets = []
    client.search("from:#{term}").each do |tweet|
      user = tweet.user || break
      tweets << {
        id: tweet.id,
        text: tweet.text,
        user: {
          screen_name: user.screen_name,
          name: user.name,
          url: user.url,
          profile_image_url: user.profile_image_url.to_s
        }
      }
    end
  end

  def self.tweet(message)
    client.update(message)
  end

  private
    def self.client
      Twitter::REST::Client.new do |config|
        config.consumer_key         = ENV['TWITTER_CONSUMER_KEY']
        config.consumer_secret      = ENV['TWITTER_CONSUMER_SECRET']
        config.access_token         = ENV['TWITTER_ACCESS_TOKEN']
        config.access_token_secret  = ENV['TWITTER_ACCESS_TOKEN_SECRET']
      end
    end
end


