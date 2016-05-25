class RecommendationsController < ApplicationController
  def index
    @recommendations = Recommendation.all
  end

  def show
    @recommendation = Recommendation.find(params[:id])
  end

  def new
    @recommendation = Recommendation.new
  end

  def create
    @recommendation = Recommendation.new
    @recommendation.notes = params[:notes]
    @recommendation.user_id = params[:user_id]
    @recommendation.category = params[:category]
    @recommendation.city_id = params[:city_id]
    @recommendation.image = params[:image]
    @recommendation.name = params[:name]

    if @recommendation.save
      redirect_to "/recommendations", :notice => "Recommendation created successfully."
    else
      render 'new'
    end
  end

  def edit
    @recommendation = Recommendation.find(params[:id])
  end

  def update
    @recommendation = Recommendation.find(params[:id])

    @recommendation.notes = params[:notes]
    @recommendation.user_id = params[:user_id]
    @recommendation.category = params[:category]
    @recommendation.city_id = params[:city_id]
    @recommendation.image = params[:image]
    @recommendation.name = params[:name]

    if @recommendation.save
      redirect_to "/recommendations", :notice => "Recommendation updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @recommendation = Recommendation.find(params[:id])

    @recommendation.destroy

    redirect_to "/recommendations", :notice => "Recommendation deleted."
  end
end
