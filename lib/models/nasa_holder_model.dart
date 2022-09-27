import 'package:dart_http/models/nasa_response_model.dart';

class NasaHolderModel {

  NasaHolderModel({
    this.id,
    this.title,
    this.copyright,
    this.date,
    this.explanation,
    this.image
  });

  final int? id;
  final String? title;
  final String? copyright;
  final String? date;
  final String? explanation;
  final String? image;

  factory NasaHolderModel.fromJson(Map<String, dynamic> json) => NasaHolderModel (
    //id : json["id"],
    title : json["title"].toString(),
    copyright : json["copyright"].toString(),
    date : json["date"].toString(),
    explanation : json["explanation"].toString(),
    image : json["hdurl"].toString()
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": copyright,
    "description": date,
    "category": explanation,
    "image": image
  };

  factory NasaHolderModel.toHolder(NasaResponseModel response) => NasaHolderModel (
    title : response.title,
    copyright : response.copyright,
    date : response.date,
    image : response.hdurl,
    explanation : response.explanation,
  );

  @override
  String toString() {
    return "NasaHolderModel id $id, title $title, copyright $copyright, date $date, explanation $explanation, image $image" ?? super.toString();
  }
}