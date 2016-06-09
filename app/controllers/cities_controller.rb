require 'open-uri'

class CitiesController < ApplicationController
  def index
    @q =  City.ransack(params[:q])
    @cities = @q.result

  end

  def show
    @city = City.find(params[:id])
    @recommendation=Recommendation.where ({:city_id => @city.id})
    @maxlikes="0"
    url_safe_street_address = URI.encode(@city.name)

    url1="http://maps.googleapis.com/maps/api/geocode/json?address=#{url_safe_street_address}"
    parsed_data = JSON.parse(open(url1).read)
    @latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]
    @longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]
    lat=@latitude.to_s
    lng=@longitude.to_s

    url2="https://api.forecast.io/forecast/c41cd2c4c2036426dbe3a1ef8c40b200/" + lat + "," + lng

    parsed_data2 = JSON.parse(open(url2).read)

    @current_temperature = parsed_data2["currently"]["temperature"]
    @summary_of_next_several_days = parsed_data2["daily"]["summary"]





  end

  def new
    @city = City.new
  end

  def create
    @city = City.new
    @city.name = params[:name]
    @city.country = params[:country]

    if @city.save
      redirect_to "/cities", :notice => "City created successfully."
    else
      render 'new'
    end
  end

  def edit
    @city = City.find(params[:id])
  end

  def update
    @city = City.find(params[:id])

    @city.name = params[:name]
    @city.country = params[:country]

    if @city.save
      redirect_to "/cities", :notice => "City updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @city = City.find(params[:id])

    @city.destroy

    redirect_to "/cities", :notice => "City deleted."
  end
end
