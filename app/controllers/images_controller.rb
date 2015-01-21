class ImagesController < ApplicationController

  
  
  def index
  	@image = Image.all
  end

  def new
  	@image = Image.new
  end

  def create
  	params.permit!
    debugger
  	@image = Image.new(params[:image])
  	log1=Logger.new("#{Rails.root}/log/image.log")
    log1.info("#{params}")
    if @image.save
  		redirect_to :action => "index"
  	else
      flash[:notice] = "Image was not uploaded!"
  		render "new"
  	end
  end

  # def edit
  #   @image = Image.find(params[:id])
  # end

  # def update
  #   params.permit!
  #   @image = Image.find(params[:id])
  #   if @image.update_attributes(params[:image])
  #     redirect_to action: "index"
  #   else
  #     render 'new'
  #   end
  # end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to action: "index"
  end

  private
  def image_params
  	params.require(:image).permit
  end

end
