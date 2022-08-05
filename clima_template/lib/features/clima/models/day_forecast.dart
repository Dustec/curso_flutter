class DayForecast {
  DayForecast({
    required this.temperature,
    required this.weather,
    required this.date,
  });
  final double temperature;
  final String weather;
  final DateTime date;

  factory DayForecast.fromJson(Map<String, dynamic> json) {
    final dynamic weatherItem =
        (json['weather'] as Iterable<dynamic>).toList()[0];
    return DayForecast(
      temperature: json['main']['temp'] as double,
      weather: weatherItem['icon'] as String,
      date: DateTime.parse(json['dt_txt'] as String),
    );
  }
}
