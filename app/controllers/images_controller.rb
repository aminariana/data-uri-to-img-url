class ImagesController < ApplicationController
  def show
    @image = Images.find(params[:id])
  end

  def new
    @image = Images.new
  end

  def create
    @image = Images.new(params[:image])

    if @image.save
      format.html { redirect_to @image, notice: 'Image was successfully created.' }
      format.json { render json: @image, status: :created, location: @image }
    else
      format.html { render action: "new" }
      format.json { render json: @image.errors, status: :unprocessable_entity }
    end
  end
end
