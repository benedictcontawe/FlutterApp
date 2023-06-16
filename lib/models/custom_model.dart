class CustomModel {

  CustomModel ( {
    this.id,
    this.name,
    this.icon,
  } );

  final int? id;
  String? name;
  final String? icon;

  factory CustomModel.fromJson(Map<String, dynamic> json) {
    return CustomModel (
      id : json["id"],
      name : json["name"].toString(),
      icon : json["icon"].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['icon'] = icon;
    return data;
  }

  @override
  String toString() {
    return "CustomModel id $id name $name icon $icon" ?? super.toString();
  }
}