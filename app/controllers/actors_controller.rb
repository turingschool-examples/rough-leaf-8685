class ActorsController < ApplicationController

  def show
    @actor = Actor.find(params[:id])
    # binding.pry
  end

end
