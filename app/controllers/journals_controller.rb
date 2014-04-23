class JournalsController < ApplicationController
  before_action :set_journal, only: [:show]



  def show
  end

  def index
    @journals = Journal.all
  end


  private

  def set_journal
    @journal = Journal.find(params[:id])
  end

end
