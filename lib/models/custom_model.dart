class CustomModel {

  CustomModel ( {
    this.id,
    this.name,
    this.icon,
  } );

  final int? id;
  final String? name;
  final String? icon;

  factory CustomModel.toHolder(/*HiveModel model*/) => CustomModel (
    //id : model.id,
    //name : model.name,
    //icon : model.icon,
  );

  @override
  String toString() {
    return "CustomModel id $id, name $name, icon $icon," ?? super.toString();
  }
}