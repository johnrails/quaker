class QuakesController < ApplicationController
  respond_to :json
  def quake
    count = params[:count] || 10
    days = params[:days] || 10
    region = params[:region] || false
    us = params[:us] ||= false
    @quakes = Earthquake.most_dangerous(count,days,region,us)
    render json: @quakes.to_json
  end
end
