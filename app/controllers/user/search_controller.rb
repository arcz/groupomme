class User::SearchController < ApplicationController
  def index
    query = params[:query]
    @users = User.all.select{|user| user.name =~ /(^| )#{query}/i }
    render json: @users
  end
end
