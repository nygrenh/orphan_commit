class PublishersController < ApplicationController
  before_action :set_publisher, only: [:show]



  def show
  end

  def index
    @publishers = Publisher.all
  end


  private

  def set_publisher
    @publisher = Publisher.find(params[:id])
  end

end
