class OauthController < ApplicationController
  def authorize
    redirect_uri = 'http://localhost:3000/oauth/callback'

    redirect_to(
      "#{ENV['ENDPOINT_URL']}/oauth/authorize?client_id=#{ENV["CLIENT_ID"]}&response_type=code&redirect_uri=#{redirect_uri}",
      allow_other_host: true
    )
  end

  def callback
  end
end
