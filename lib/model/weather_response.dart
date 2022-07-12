// To parse this JSON data, do
//
//     final weatherApiResponse = weatherApiResponseFromJson(jsonString);

import 'dart:convert';

WeatherApiResponse weatherApiResponseFromJson(String str) => WeatherApiResponse.fromJson(json.decode(str));

String weatherApiResponseToJson(WeatherApiResponse data) => json.encode(data.toJson());

class WeatherApiResponse {
    WeatherApiResponse({
        this.lat,
        this.lon,
        this.timezone,
        this.timezoneOffset,
        this.current,
        this.minutely,
    });

    double? lat;
    double? lon;
    String? timezone;
    int? timezoneOffset;
    Current? current;
    List<Minutely>? minutely;

    factory WeatherApiResponse.fromJson(Map<String, dynamic> json) => WeatherApiResponse(
      lat: json["lat"].toDouble(),
      lon: json["lon"].toDouble(),
      timezone: json["timezone"],
      timezoneOffset: json["timezone_offset"],
      current: Current.fromJson(json["current"]),
      minutely: List<Minutely>.from(json["minutely"].map((x) => Minutely.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
      "lat": lat,
      "lon": lon,
      "timezone": timezone,
      "timezone_offset": timezoneOffset,
      "current": current!.toJson(),
      "minutely": List<dynamic>.from(minutely!.map((x) => x.toJson())),
    };
}

class Current {
    Current({
      this.dt,
      this.sunrise,
      this.sunset,
      this.temp,
      this.feelsLike,
      this.pressure,
      this.humidity,
      this.dewPoint,
      this.uvi,
      this.clouds,
      this.visibility,
      this.windSpeed,
      this.windDeg,
      this.weather,
    });

    int? dt;
    int? sunrise;
    int? sunset;
    double? temp;
    double? feelsLike;
    int? pressure;
    int? humidity;
    double? dewPoint;
    double? uvi;
    int? clouds;
    int? visibility;
    double? windSpeed;
    int? windDeg;
    List<Weather>? weather;

    factory Current.fromJson(Map<String, dynamic> json) => Current(
        dt: json["dt"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        temp: json["temp"].toDouble(),
        feelsLike: json["feels_like"].toDouble(),
        pressure: json["pressure"],
        humidity: json["humidity"],
        dewPoint: json["dew_point"].toDouble(),
        uvi: json["uvi"].toDouble(),
        clouds: json["clouds"],
        visibility: json["visibility"],
        windSpeed: json["wind_speed"].toDouble(),
        windDeg: json["wind_deg"],
        weather: List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "dt": dt,
        "sunrise": sunrise,
        "sunset": sunset,
        "temp": temp,
        "feels_like": feelsLike,
        "pressure": pressure,
        "humidity": humidity,
        "dew_point": dewPoint,
        "uvi": uvi,
        "clouds": clouds,
        "visibility": visibility,
        "wind_speed": windSpeed,
        "wind_deg": windDeg,
        "weather": List<dynamic>.from(weather!.map((x) => x.toJson())),
    };
}

class Weather {
    Weather({
        this.id,
        this.main,
        this.description,
        this.icon,
    });

    int? id;
    String? main;
    String? description;
    String? icon;

    factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"],
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
    };
}

class Minutely {
    Minutely({
        this.dt,
        this.precipitation,
    });

    int? dt;
    int? precipitation;

    factory Minutely.fromJson(Map<String, dynamic> json) => Minutely(
        dt: json["dt"],
        precipitation: json["precipitation"],
    );

    Map<String, dynamic> toJson() => {
        "dt": dt,
        "precipitation": precipitation,
    };
}
