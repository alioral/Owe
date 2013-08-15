class User < ActiveRecord::Base
  #attr_accessible :name, :oauth_expires_at, :oauth_token, :oauth_token_secret, :provider, :uid

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token

      if auth.provider == 'facebook'
        user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      else
        user.oauth_token_secret = auth.credentials.secret
      end
      
      user.save!
    end
  end

  def printName

    if self.name != nil
      nameToPrint = self.name.split(' ')

      if nameToPrint.length > 1
        return nameToPrint[0]
      end

    end
    return 'Anonymous'
  
  end

  def post(message)

    if self.provider == 'twitter'
      
      Twitter.configure do |config|
        config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
        config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
        config.oauth_token = self.oauth_token
        config.oauth_token_secret = self.oauth_token_secret
      end
      client = Twitter::Client.new
      begin
        client.update(message)
      rescue Exception => e
        puts(:oauth_token, "Unable to send to twitter: #{e.to_s}")
      end

    else  # Provider is facebook

      me = FbGraph::User.me(self.oauth_token)
      me.feed!(
        :message => message,
      )

    end

  end

end
