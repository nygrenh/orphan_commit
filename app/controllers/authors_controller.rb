class AuthorsController < ApplicationController
  before_action :set_author, only: [:show]



  def show
  end

  def index
    @authors = Author.all
  end


  private

  def set_author
    @author = Author.find(params[:id])
  end

end
