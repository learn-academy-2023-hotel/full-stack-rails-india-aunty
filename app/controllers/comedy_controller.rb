class ComedyController < ApplicationController
  # all instances
  def index
    @joke_list = Comedy.all
  end

  # one instance
  def show
    @one_joke = Comedy.find(params[:id])
  end

  # new instance
  def new
    @new_joke = Comedy.new
  end

  def create
    @new_joke = Comedy.create(joke_params)
    if @new_joke.valid?
      redirect_to comedies_path
    end
  end

  private
  def joke_params
    params.require(:comedy).permit(:joke, :punch_line)
  end
end
