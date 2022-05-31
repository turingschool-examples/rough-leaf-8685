class StudiosController < ApplicationController

  def index
    @studios = Studio.all
    # @studio = Studio.find(params[:id])
  end
end
