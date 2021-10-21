class OrganizationsController < ApplicationController
  def index
    organizations = Organization.where("name ILIKE ?", "%#{params[:term]}%")

    render json: {
      results: organizations.map do |organization|
        {
          id: organization.id,
          text: organization.name
        }
      end
    }
  end
end
