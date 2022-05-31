class ActorsController < ApplicationController

  def new
  end

  def create
    @actor = Actor.create(actor_params)
    redirect_to "/movies/#{@actor.id}"
  end

  private
  def actor_paranms
    params.permit(:name, :age)
  end
end
