class LikesController < ApplicationController
  def index
    @likes = Like.all
  end

  def show
    @like = Like.find(params[:id])
  end

  def new
    @like = Like.new
  end

  def create
    @like = Like.new
    @like.recommendation_id = params[:recommendation_id]
    @like.user_id = params[:user_id]

    if @like.save
      redirect_to "/recommendations/", :notice => "Like recorded successfully."
    else
      render 'new'
    end
  end

  def edit
    @like = Like.find(params[:id])
  end

  def update
    @like = Like.find(params[:id])

    @like.recommendation_id = params[:recommendation_id]
    @like.user_id = params[:user_id]

    if @like.save
      redirect_to "/likes", :notice => "Like updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @like = Like.find(params[:id])

    @like.destroy

    redirect_to "/likes", :notice => "Like deleted."
  end
end
