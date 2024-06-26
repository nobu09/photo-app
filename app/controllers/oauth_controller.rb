require 'net/http'

class OauthController < ApplicationController
  REDIRECT_URI = 'http://localhost:3000/oauth/callback'.freeze

  def authorize
    redirect_to(
      "#{ENV['ENDPOINT_URL']}/oauth/authorize?client_id=#{ENV["CLIENT_ID"]}&response_type=code&redirect_uri=#{REDIRECT_URI}",
      allow_other_host: true
    )
  end

  def callback
    uri = URI.parse("#{ENV['ENDPOINT_URL']}/oauth/token")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    req = Net::HTTP::Post.new(uri.path)
    req.basic_auth(ENV['CLIENT_ID'], ENV['CLIENT_SECRET'])
    req.set_form_data({
                        code: params[:code],
                        client_id: ENV['CLIENT_ID'],
                        client_secret: ENV['CLIENT_SECRET'],
                        redirect_uri: REDIRECT_URI,
                        grant_type: 'authorization_code'
                      })
    res = http.request(req)
    session[:access_token] = JSON.parse(res.body)['access_token']

    redirect_to photos_path
  end
end
