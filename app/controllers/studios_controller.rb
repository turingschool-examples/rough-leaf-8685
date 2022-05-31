class StudiosController < ApplicationController
  def index
    require "pry"; binding.pry
    @studios = Studio.all
  end
end
