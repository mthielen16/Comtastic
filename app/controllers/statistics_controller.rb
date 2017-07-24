class StatisticsController < ApplicationController


  def home

    @date_array= []
    @Colnames = Playerdat.column_names.from(7).each do |col|
      @date_array.push col.tr('t','')
    end

    @All        = Playerdat.all
    @Torwart     = Playerdat.where(position: "Torhüter")
    @Abwehr     = Playerdat.where(position: "Abwehr")
    @Mittelfeld     = Playerdat.where(position: "Mittelfeld")
    @Stürmer     = Playerdat.where(position: "Stürmer")

  end

  def show
    @Spielername = Playerdat.find_by(name: params[:search]).attributes["name"]
  end

end