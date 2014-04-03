class ReferencesController < ApplicationController
  def index

    @references = Reference.all


  end
end