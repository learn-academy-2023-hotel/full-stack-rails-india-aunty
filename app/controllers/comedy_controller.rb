class ComedyController < ApplicationController
  # all instances
  def index
    @joke_list = Comedy.all
  end

  # one instance
  def show
    @one_joke = Comedy.find(params[:id])
  end

end
