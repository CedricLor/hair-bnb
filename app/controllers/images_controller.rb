class ImagesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @image = Image.new
  end

  def create
    @user = User.find(params[:user_id])
    @image = @user.images.build(image_params)
    @image.save
    redirect_to @user
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def image_params
    params.require(:image).permit(:picture)
  end


end
