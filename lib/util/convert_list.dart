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

  static List<NasaResponseModel> toResponseList(List<dynamic> data) {
    List<NasaResponseModel> value = <NasaResponseModel>[];
    data.forEach((element) {
      value.add(NasaResponseModel.fromJson(element));
    });
    return value ?? List<NasaResponseModel>.empty();
  }
}