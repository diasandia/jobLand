class RubricsController < ApplicationController


  def new
    @rubric = Rubric.new
  end

  def create
    @rubric = Rubric.new(params[:post])
    @rubric.save

  end

  def show
    @rubric = Rubric.find(params[:id])
  end

end

