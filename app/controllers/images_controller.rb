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
    # wipe out model objects that are too old to matter. Alternatively,
    # the database cost should be handled.

    # ... AAAAAnd the database diverged beyond Heroku's 10K row capabity.
    # I'm wiping out anything older than the last 10K rows. If you want to
    # keep stuff for a long time, either host your own or offer to pay me a
    # monthly subscription fee so I can cover Heroku costs.
    parallel_uploads_max = 1000
    free_capacity = 10000 - parallel_uploads_max
    actual_row_count = Image.count
    above_capacity = actual_row_count - free_capacity
    if above_capacity > 0
      Image.limit(above_capacity).find_each(batch_size: 50) do |img|
        Rails.logger.warn("[DELETE] #{img.id}: \"#{img.token}\"")
        img.destroy!
      end
    end

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
    send_data @image.decode, :type => "image/png", :disposition => 'inline'
  end

  private

  def find
    @image = Image.find_by!(token: params[:id])
  end

  def image_params
    params.require(:image).permit!
  end
end
