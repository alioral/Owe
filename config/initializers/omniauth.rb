Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_SECRET'], 
  		   :scope => 'publish_stream,email,offline_access,manage_pages'
  provider :twitter, ENV['TWITTER_CONSUMER_KEY'], ENV['TWITTER_CONSUMER_SECRET']
end

=begin
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "605812252773074", "99004809987c8195d93f28c6d72e8d1c", 
  		   :scope => 'publish_stream,email,offline_access,manage_pages'
  provider :twitter, "NfLpsp9we8ENW6o0koww", "2GPZ2bTEReiz90hcECp1jesvxjU8bvdQw672SX9Pmz8"
end
=end