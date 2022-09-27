import 'dart:convert';
import 'package:dart_http/models/nasa_holder_model.dart';
import 'package:dart_http/models/nasa_response_model.dart';

class ConvertList {
  static List<NasaHolderModel> toHolderList(List<NasaResponseModel> responses) {
    return List<NasaHolderModel>.from(
      responses.map( (response) => 
        NasaHolderModel.toHolder(response)
      )
    );
  }

  static List<NasaResponseModel> toResponseList(String data) {
    return List<NasaResponseModel>.from(
      json.decode(data).map( (x) => 
        NasaResponseModel.fromJson(x)
      )
    );
  }

  static String toJson(List<NasaResponseModel> data) {
  return json.encode(
    List<dynamic>.from(
      data.map( (x) =>
        x.toJson()
      )
    )
  );
}
}