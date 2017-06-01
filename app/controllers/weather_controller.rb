class WeatherController < ApplicationController
  def stuff
    @stuff = 'hello there'
  end

  def current_conditions
    @weather = []
    open('http://api.wunderground.com/api/' + ENV['wunderground_key'] + '/geolookup/conditions/q/IN/Indianapolis.json') do |f|
      json_string = f.read
      parsed_json = JSON.parse(json_string)
      temp_f = parsed_json['current_observation']['temp_f']
      indy_hum = parsed_json['current_observation']['relative_humidity']
      indy = Indy.new
      indy.temp = temp_f
      indy.humidity = indy_hum
      indy.save
      @weather << indy
    end
    open('http://api.wunderground.com/api/' + ENV['wunderground_key'] + '/geolookup/conditions/q/ID/Boise.json') do |f|
      json_string = f.read
      parsed_json = JSON.parse(json_string)
      boise = Boise.new
      temp_b = parsed_json['current_observation']['temp_f']
      boise.temp = temp_b
      boise.humidity = parsed_json['current_observation']['relative_humidity']
      boise.save

      @weather << boise
    end
    render json: @weather
  end

  def average_humidity
    indy_final = []
    indy_raw_hums = Indy.all
    indy_hums = indy_raw_hums.collect(&:humidity)
    indy_hums.each do |hum|
      indy_final << hum.tr('%', '').to_i
    end
  end

  def find_average(arr)
    arr.reduce
  end

  def prep_to_average
  end
end
