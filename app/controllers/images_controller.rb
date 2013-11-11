class ImagesController < ApplicationController
  before_filter :find, :only => [:show, :decode]

  def show
    respond_to do |format|
      format.html {}
      format.json {
        render json: {
          url: render_image_url(@image)
        }, status: :ok
      }
    end
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)

    # TODO: Since the Data URI too large and is being saved to provide a
    # non-transient state at GET URL time, the database size will diverge.
    # If this module becomes popular, a line should be placed here to
    # wipe out model objects that are too old to matter.

    respond_to do |format|
      if @image.save        
        format.html { redirect_to @image, notice: 'Image was successfully created.' }
        format.json {
          render json: {
            url: render_image_url(@image)
          }, status: :created
        }
      else
        format.html { render action: "new" }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  def decode
    # Render as a real image.
    send_data @image.decode, :type => "image", :disposition => 'inline'
  end

  private

  def find
    @image = Image.find_by_token(params[:id])
  end

  def image_params
    params.require(:image).permit!
  end
end
