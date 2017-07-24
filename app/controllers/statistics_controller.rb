class StatisticsController < ApplicationController

  def home

    @date_array= []
    @Colnames = Playerdat.column_names.from(7).each do |col|
      @date_array.push col.tr('t','')
    end
    @All = Playerdat.all
    @Torwart     = Playerdat.where(position: "Torhüter")
    @Abwehr     = Playerdat.where(position: "Abwehr")
    @Mittelfeld     = Playerdat.where(position: "Mittelfeld")
    @Stürmer     = Playerdat.where(position: "Stürmer")

    @all_value= []
    @Colnames.each do |col|
      @all_value.push @All.sum(col)
    end

    @tw_value= []
    @Colnames.each do |col|
      @tw_value.push @Torwart.sum(col)
    end

    @aw_value= []
    @Colnames.each do |col|
      @aw_value.push @Abwehr.sum(col)
    end

    @mf_value= []
    @Colnames.each do |col|
      @mf_value.push @Mittelfeld.sum(col)
    end

    @st_value= []
    @Colnames.each do |col|
      @st_value.push @Stürmer.sum(col)
    end


    color =["#BF3F3F","#FF4500","#00FFFF","#228B22","#00008B"]
    @marktwert_total = LazyHighCharts::HighChart.new('graph') do |f|
      f.chart({defaultSeriesType: "area"})
      f.title(text: "Gesamtmarktwert 17/18")
      f.series(name: "Gesamtmarktwert 17/18", yAxis: 0, data: @all_value, color: color[0])
      f.yAxis [{title: {text: "Marktwert in Millionen", margin: 40} }]
      f.legend(enabled: true)
    end

    @tw_total = LazyHighCharts::HighChart.new('graph') do |f|
      f.chart({defaultSeriesType: "area"})
      f.title(text: "Torwart Marktwert 17/18")
      f.series(name: "Torwart Marktwert 17/18", yAxis: 0, data: @tw_value, color: color[1])
      f.yAxis [{title: {text: "Marktwert in Millionen", margin: 40} }]
    end

    @aw_total = LazyHighCharts::HighChart.new('graph') do |f|
      f.chart({defaultSeriesType: "area"})
      f.title(text: "Abwehr Marktwert 17/18")
      f.series(name: "Abwehr Marktwert 17/18", yAxis: 0, data: @aw_value, color: color[2])
      f.yAxis [{title: {text: "Marktwert in Millionen", margin: 40} }]
    end

    @mf_total = LazyHighCharts::HighChart.new('graph') do |f|
      f.chart({defaultSeriesType: "area"})
      f.title(text: "Mittelfeld Marktwert 17/18")
      f.series(name: "Mittelfeld Marktwert 17/18", yAxis: 0, data: @mf_value, color: color[3])
      f.yAxis [{title: {text: "Marktwert in Millionen", margin: 40} }]
    end

    @st_total = LazyHighCharts::HighChart.new('graph') do |f|
      f.chart({defaultSeriesType: "area"})
      f.title(text: "Stürmer Marktwert 17/18")
      f.series(name: "Stürmer Marktwert 17/18", yAxis: 0, data: @st_value, color: color[4])
      f.yAxis [{title: {text: "Marktwert in Millionen", margin: 40} }]
    end

    @chart_globals = LazyHighCharts::HighChartGlobals.new do |f|
      f.global(useUTC: false)
      f.chart(
              backgroundColor: {
              linearGradient: [0, 0, 500, 500],
              stops: [
                  [0, "rgb(255, 255, 255)"],
                  [1, "rgb(240, 240, 255)"]
              ]
          },

          plotBackgroundColor: "rgba(255, 255, 255, .9)",
          plotShadow: true,
          plotBorderWidth: 1)
      f.xAxis(categories: @date_array)
      f.lang(thousandsSep: ",")
      f.legend(enabled: false)
      f.chart({defaultSeriesType: "area"})
      f.colors(["#90ed7d", "#f7a35c", "#8085e9", "#f15c80", "#e4d354"])
      f.plotOptions(area: {marker: {enabled: false}})

    end
  end




  def show
    @spielerdata = []
    Playerdat.find_by(name: params[:search]).attributes.each do |key, value|
      @spielerdata.push value
    end





    @date_array= []
    @dates = Playerdat.column_names.from(7).each do |col|
      @date_array.push col.tr('t','')
    end

    @Spielername = Playerdat.find_by(name: params[:search]).attributes["name"]
    @Spieler = Playerdat.find_by(name: params[:search]).attributes

    @spieler_value = []
    @dates.each do |col|
      @spieler_value.push @Spieler[col]
    end

    @spieler_mw = LazyHighCharts::HighChart.new('graph') do |f|
      f.chart({defaultSeriesType: "area"})
      f.series(name: "Marktwert von #{@Spielername} 17/18", yAxis: 0, data: @spieler_value, color: "#666699")
      f.yAxis [{title: {text: "Marktwert in Millionen", margin: 40} }]
      f.legend(enabled: false)
    end

    @chart_globals = LazyHighCharts::HighChartGlobals.new do |f|
      f.global(useUTC: false)
      f.chart(
          backgroundColor: {
              linearGradient: [0, 0, 500, 500],
              stops: [
                  [0, "rgb(255, 255, 255)"],
                  [1, "rgb(240, 240, 255)"]
              ]
          },

          plotBackgroundColor: "rgba(255, 255, 255, .9)",
          plotShadow: true,
          plotBorderWidth: 1)
      f.xAxis(categories: @date_array)
      f.lang(thousandsSep: ",")
      f.legend(enabled: false)
      f.chart({defaultSeriesType: "area"})
      f.plotOptions(area: {marker: {enabled: false}})

    end
  end
end