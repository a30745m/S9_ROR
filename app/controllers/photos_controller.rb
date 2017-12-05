class PhotosController < ApplicationController
  before_action :set_photo, :only => [:show, :edit, :update, :destroy]
  # 以下接續原有程式碼
  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to photos_url
    else
      render :new
    end
  end

  # 因為有before_action，所以show和edit action可以刪除
  def show
  end

  def edit
  end

  def update
    if @photo.update_attributes(photo_params)
      redirect_to photos_path(@photo)
    else
      render :edit
    end
  end

  def destroy
    @photo.destroy
    redirect_to photos_url
  end

  private

  def set_photo
    @photo = Photo.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:title, :date, :description, :file_location)
  end
end
