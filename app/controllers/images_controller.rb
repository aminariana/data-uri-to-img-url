class ImagesController < ApplicationController
  def show
    @image = Image.find(params[:id])
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(params[:image])

    if @image.save
      format.html { redirect_to @image, notice: 'Image was successfully created.' }
      format.json { render json: @image, status: :created, location: @image }
    else
      format.html { render action: "new" }
      format.json { render json: @image.errors, status: :unprocessable_entity }
    end
  end
end
