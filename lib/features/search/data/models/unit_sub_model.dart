import 'package:nawy_task/features/search/business/entities/unit_sub_entities.dart';

class PropertyTypeModel extends PropertyTypeEntity {
  const PropertyTypeModel({required int id, required String name})
      : super(name: name, id: id);

  factory PropertyTypeModel.fromJson(Map<String, dynamic> json) {
    return PropertyTypeModel(
      id: json["id"],
      name: json["name"],
    );
  }
}

class CompoundDetailsModel extends CompoundDetailsEntity {
  const CompoundDetailsModel({required int id, required String name})
      : super(name: name, id: id);

  factory CompoundDetailsModel.fromJson(Map<String, dynamic> json) {
    return CompoundDetailsModel(
      id: json["id"],
      name: json["name"],
    );
  }
}

class DeveloperModel extends DeveloperEntity {
  const DeveloperModel(
      {required int id, required String name, required String logo})
      : super(name: name, id: id, logo: logo);

  factory DeveloperModel.fromJson(Map<String, dynamic> json) {
    return DeveloperModel(
      id: json["id"],
      name: json["name"],
      logo: json["logo_path"],
    );
  }
}
