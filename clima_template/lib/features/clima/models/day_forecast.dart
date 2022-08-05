class DayForecast {
  DayForecast({
    required this.temperature,
    required this.weather,
    required this.date,
  });
  final double temperature;
  final String weather;
  final DateTime date;

  DayForecast fromJson(Map<String, dynamic> json) => DayForecast(
        temperature: json['main']['temp'] as double,
        weather: json['weather']['icon'] as String,
        date: json['dt_txt'] as DateTime,
      );
}
