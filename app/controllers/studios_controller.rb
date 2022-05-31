class StudiosController < ApplicationController
  def index
    @studios = Studio.all
    # binding.pry
  end
end
