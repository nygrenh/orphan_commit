class SeriesController < ApplicationController
  before_action :set_series, only: [:show]



  def show
  end

  def index
    @series = Series.all
  end


  private

  def set_series
    @series = Series.find(params[:id])
  end

end
