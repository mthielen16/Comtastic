class StatisticsController < ApplicationController


  def home
  end

  def show
    @Spieler = Playerdat.find_by(name: params[:search]).attributes
    @all     = Playerdat.where(position: "Torhüter")
  end

end