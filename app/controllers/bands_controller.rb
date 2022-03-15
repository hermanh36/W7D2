class BandsController < ApplicationController
  def index
    @bands = Band.all
    render :index
  end

  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.new(band_params)
    if band.save
      redirect_to band_url(@band.id)
    else
      #some error
    end
  end

  def edit 
    @band = Band.find(params[:id])
    redirect_to edit_band_url
  end

  def update 
    @band = Band.find([params[:id])
    if @band.update(band_params)
      redirect_to band_url(@band.id)
    else
      #some error
    end
  end
  
  def delete
    Band.find(params[:id]).destroy
    #redirect somewhere
  end

  def band_params
    params.require(:bands).permit(:name)
end