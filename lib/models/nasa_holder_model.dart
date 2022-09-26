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