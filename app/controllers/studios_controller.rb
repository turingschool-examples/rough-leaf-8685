class StudiosController < ApplicationController
  def index
    @studios = Studio.all
    # require "pry"; binding.pry
  end
end
