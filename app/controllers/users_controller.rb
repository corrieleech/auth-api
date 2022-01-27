class UsersController < ApplicationController
  before_action :authenticate_user, only: [:show]

  def index
    users = User.all
    render json: users
  end

  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def show
    render json: current_user
  end

end

#HALP! I couldn't figure out the logic to get a sad path on the show route. Tried something the lines of...

#def show
  #id = current_user.id
  #if id == params[:id]
    #render json: current_user
  #else
    #sad path
  #end
#end