class Show {
  int number;
  String title;
  DateTime date;
  String url;
  String slug;
  String html;
  String notesFile;
  String displayDate;
  String displayNumber;

  Show({
    required this.number,
    required this.title,
    required this.date,
    required this.url,
    required this.slug,
    required this.html,
    required this.notesFile,
    required this.displayDate,
    required this.displayNumber,
  });

  factory Show.fromJson(Map<String, dynamic> json) {
    return new Show(
      number: json['number'] as int,
      title: json['title'] as String,
      date: DateTime.fromMicrosecondsSinceEpoch(json['date']),
      url: json['url'] as String,
      slug: json['slug'] as String,
      html: json['html'] as String,
      notesFile: json['notesFile'] as String,
      displayDate: json['displayDate'] as String,
      displayNumber: json['displayNumber'] as String,
    );
  }
}
