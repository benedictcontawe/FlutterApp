import 'dart:convert';

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

  @override
  String toString() {
    return "NasaHolderModel id $id, title $title, copyright $copyright, date $date, explanation $explanation, image $image" ?? super.toString();
  }
}

List<NasaHolderModel> nasaHolderModelFromJson(String str) {
  return List<NasaHolderModel>.from(
        json.decode(str).map( (x) => 
          NasaHolderModel.fromJson(x)
        )
    );
}
    
String productsModelToJson(List<NasaHolderModel> data) {
  return json.encode(
      List<dynamic>.from(
          data.map( (x) =>
            x.toJson()
           )
        )
    );
}

