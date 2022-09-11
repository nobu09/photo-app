class PhotosController < ApplicationController
  def index
    @photos = Photo.all.order(created_at: :desc)
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to photos_path, notice: '写真をアップロードしました'
    else
      render :new
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :image)
  end
end
