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

  def torwart
      values = []
      @Colnames.each do |col|
          values.push @Torwart.sum(col)
      end
      @result = @date_array.zip(values.cycle).to_h

      area_chart @result, width: "600px",
                colors: ["#ffcc00"],
                 title: {text: 'My custom title'}

  end
  def abwehr
    values = []
    @Colnames.each do |col|
      values.push @Abwehr.sum(col)
    end
    @result = @date_array.zip(values.cycle).to_h

    area_chart @result, width: "600px",
               colors: ["#cc3300"],
               library: {lineTension: 0, pointRadius: 0}
  end

  def mittelfeld
    values = []
    @Colnames.each do |col|
      values.push @Mittelfeld.sum(col)
    end
    @result = @date_array.zip(values.cycle).to_h

    area_chart @result, width: "600px",
               colors: ["#ff6600"],
               library: {lineTension: 0, pointRadius: 0}
  end

  def stürmer
    values = []
    @Colnames.each do |col|
      values.push @Stürmer.sum(col)
    end
    @result = @date_array.zip(values.cycle).to_h

    area_chart @result, width: "600px",
               colors: ["#00cc00"],
               library: {lineTension: 0, pointRadius: 0}
  end





end
