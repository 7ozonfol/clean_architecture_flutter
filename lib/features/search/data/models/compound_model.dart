import 'package:nawy_task/features/search/business/entities/compound_entity.dart';

class CompoundModel extends CompoundEntity {
  const CompoundModel({
    required int id,
    required String name,
    required int areaId,
  }) : super(id: id, name: name, areaId: areaId);

  factory CompoundModel.fromJson(Map<String, dynamic> json) {
    return CompoundModel(
        id: json["id"], name: json["name"], areaId: json["area_id"]);
  }
}
