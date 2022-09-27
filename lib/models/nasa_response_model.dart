class NasaResponseModel {
  
  NasaResponseModel({
    required this.title,
    required this.copyright,
    required this.date,
    required this.hdurl,
    required this.explanation,
  });

  final String? title;
  final String? copyright;
  final String? date;
  final String? hdurl;
  final String? explanation;

  factory NasaResponseModel.fromJson(Map<String, dynamic> json) => NasaResponseModel (
    title : json["title"].toString(),
    copyright : json["copyright"].toString(),
    date : json["date"].toString(),
    hdurl : json["hdurl"].toString(),
    explanation : json["explanation"].toString(),
  );

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['copyright'] = copyright;
    data['date'] = date;
    data['hdurl'] = hdurl;
    data['explanation'] = explanation;
    return data;
  }

  @override
  String toString() {
    return "NasaResponseModel title $title, copyright $copyright, date $date, explanation $explanation, hdurl $hdurl" ?? super.toString();
  }
}