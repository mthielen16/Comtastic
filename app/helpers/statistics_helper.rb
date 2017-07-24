module StatisticsHelper


  def player
    key_array = []
    value_array = []
    @Spieler.each_pair do |key, value|
      key2 = key.tr('t','')
      key_array.push key2
      value_array.push value
    end
    result = key_array.from(7).zip(value_array.from(7).cycle).to_h

    area_chart result, width: "600px",
               colors: ["green", "#FF0000"],
               library: {lineTension: 0, pointRadius: 0}
  end


end
