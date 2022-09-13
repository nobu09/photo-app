require 'net/http'

class PhotosController < ApplicationController
  def index
    @photos = Photo.where(user: current_user).order(created_at: :desc)
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user = current_user
    if @photo.save
      redirect_to photos_path, notice: '写真をアップロードしました'
    else
      render :new
    end
  end

  def tweet
    photo = Photo.where(user_id: current_user).find(params[:id])

    uri = URI.parse("#{ENV['ENDPOINT_URL']}/api/tweets")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    req = Net::HTTP::Post.new(uri.path)
    req['Authorization'] = "Bearer #{session[:access_token]}"
    req['Content-Type'] = 'application/json'
    req.body = {
      text: photo.title,
      url: Rails.application.routes.url_helpers.rails_representation_url(photo.image_variant_path)
    }.to_json

    res = http.request(req)

    if res.code == '201'
      redirect_to photos_path, notice: '画像をツイートしました'
    else
      redirect_to photos_path, alert: '画像のツイートに失敗しました'
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :image)
  end
end
