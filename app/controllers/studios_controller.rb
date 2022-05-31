class StudiosController < ApplicationController
  def index
    # binding.pry
    @studios = Studio.all
  end
end
