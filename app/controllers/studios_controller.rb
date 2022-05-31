class StudiosController < ApplicationController
  def index
    @studio = Studio.all
  end
end
