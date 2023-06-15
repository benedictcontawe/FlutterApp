class CustomModel {

  CustomModel ( {
    this.id,
    this.name,
    this.icon,
  } );

  final int? id;
  String? name;
  final String? icon;

  @override
  String toString() {
    return "CustomModel id $id name $name icon $icon" ?? super.toString();
  }
}