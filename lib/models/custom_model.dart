class CustomModel {

  CustomModel ( {
    this.id,
    this.name,
    //this.icon,
  } );

  final int? id;

  final String? name;

  //final Icon? icon;

  factory CustomModel.toHolder(/*HiveModel model*/) => CustomModel (
    //id : model.id,
    //name : model.name,
    //icon : model.icon,
  );

  factory CustomModel.fromJson(Map<String, dynamic> json) {
    return CustomModel(
      id: json['id'], name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name
    };
  }

  @override
  String toString() {
    return "CustomModel id $id, name $name" ?? super.toString();
  }
}