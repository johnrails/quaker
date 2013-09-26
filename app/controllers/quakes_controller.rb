class QuakesController < ApplicationController
  respond_to :json
  def quake
    @quakes = Earthquake.first
    render json: @quakes
  end
end
