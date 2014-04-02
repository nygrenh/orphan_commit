class ReferencesController < ApplicationController
  def index
    @articles = Article.all
    @references = Array.new
    @references << @articles
    # later @references << @other_reference_types

    @amount = 0
    @references.each do |referencetype|
      referencetype.each do
        @amount = @amount + 1
      end
    end

  end
end