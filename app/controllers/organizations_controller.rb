class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show]



  def show
  end

  def index
    @organizations = Organization.all
  end


  private

  def set_organization
    @organization = Organization.find(params[:id])
  end

end
