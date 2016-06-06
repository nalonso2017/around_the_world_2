class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @users = User.find(params[:id])
  end

  def new
    @users = User.new
  end

  def create
    @users = User.new


    if @users.save
      redirect_to "/users", :notice => "User created successfully."
    else
      render 'new'
    end
  end

  def edit
    @users = User.find(params[:id])
  end

  def update
    @users = User.find(params[:id])


    if @users.save
      redirect_to "/users", :notice => "User updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @users = User.find(params[:id])

    @users.destroy

    redirect_to "/likes", :notice => "User deleted."
  end
end
