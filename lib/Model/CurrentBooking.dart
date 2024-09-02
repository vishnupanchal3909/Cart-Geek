class CurrentBooking {
  final String title;
  final String from_date;
  final String from_time;
  final String? to_date;
  final String to_time;

  CurrentBooking({
    required this.title,
    required this.from_date,
    required this.from_time,
    required this.to_date,
    required this.to_time,
  });

  factory CurrentBooking.fromJson(Map<String, dynamic> json) {
    return CurrentBooking(
      title: json['title'] ?? 'N/A',
      from_date: json['from_date'] ?? 'N/A',
      from_time: json['from_time'] ?? 'N/A',
      to_date: json['to_date'] ?? 'N/A',
      to_time: json['to_time'] ?? '0.0',
    );
  }
}