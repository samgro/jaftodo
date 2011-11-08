class TodosController < ApplicationController
  def index
  end
  
  def create
    render :json => JSON.generate({})
  end
end