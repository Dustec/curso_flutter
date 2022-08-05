class CurrentWeather {
  CurrentWeather({
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
    required this.weatherTitle,
    required this.weatherDescription,
    required this.weatherImage,
    required this.location,
  });
  final double temperature;
  final int humidity;
  final double windSpeed;
  final String weatherTitle;
  final String weatherDescription;
  final String weatherImage;
  final String location;

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    final dynamic weatherItem =
        (json['weather'] as Iterable<dynamic>).toList()[0];
    return CurrentWeather(
      temperature: json['main']['temp'] as double,
      humidity: json['main']['humidity'] as int,
      windSpeed: json['wind']['speed'] as double,
      weatherTitle: weatherItem['main'],
      weatherDescription: weatherItem['description'] as String,
      weatherImage: weatherItem['icon'] as String,
      location: json['name'] as String,
    );
  }
}
