import '../../business/entities/area_entity.dart';

class AreaModel extends AreaEntity {
  const AreaModel({
    required int id,
    required String name,
  }) : super(id: id, name: name);

  factory AreaModel.fromJson(Map<String, dynamic> json) {
    return AreaModel(id: json["id"], name: json["name"]);
  }
}
