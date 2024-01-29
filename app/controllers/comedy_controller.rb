class ComedyController < ApplicationController
  def index
    @joke_list = Comedy.all
  end
end
