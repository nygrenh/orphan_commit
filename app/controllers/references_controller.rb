class ReferencesController < ApplicationController
  def index
    @articles = Article.all
    @references = Array.new
    @references << @articles
    # later @references << @other_reference_types
  end
end