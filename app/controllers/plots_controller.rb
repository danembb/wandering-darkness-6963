class PlotsController < ApplicationController

  def index
    @plots = Plot.all
  end

  def destroy
    Plant.destroy(params[:id])
    redirect_to '/plots'
  end
end
