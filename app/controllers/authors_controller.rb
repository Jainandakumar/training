class AuthorsController < ApplicationController

  skip_before_action :require_login, :only => :index

  def index
  	@author = Author.all
  end

  def new
  	@author = Author.new
    @image=Image.new
  end

  def create
   # debugger
  	params.permit!
  	@author = Author.new
    @author.name=(params[:author][:name])
    @author.title=(params[:author][:title])
    @author.email=(params[:author][:email])
    @author.description=(params[:author][:description])
    @author.image = Image.new(:photo=>params[:author][:image])
  	if @author.save
  		redirect_to action: "index"
  	else
  		render 'new'
  	end
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    params.permit!
    @author = Author.find(params[:id])
    if @author.update_attributes(params[:author])
      redirect_to action: "index"
    else
      render 'new'
    end
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy
    redirect_to action: "index"
  end


  private
  def author_params
  	params.require(:author).permit
  end

end
