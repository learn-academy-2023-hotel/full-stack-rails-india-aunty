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

  # update
  def edit
    @modified_joke = Comedy.find(params[:id]) 
  end

  def update
    @modified_joke = Comedy.find(params[:id]) 
    @modified_joke.update(joke_params)
    if @modified_joke.valid?
      redirect_to comedy_path
    end
  end

  def destroy
    @no_joke = Comedy.find(params[:id])
    @no_joke.destroy
    redirect_to comedies_path
  end

  private
  def joke_params
    params.require(:comedy).permit(:joke, :punch_line)
  end
end
