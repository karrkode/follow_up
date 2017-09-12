class SessionsController < ApplicationController
  def new
  end

  def create
  	binding.pry
  	render 'new'
  end

  def destroy
  end
end
