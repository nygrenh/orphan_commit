class BibtexController < ApplicationController

  def index
    @references = Reference.all
  end

end
