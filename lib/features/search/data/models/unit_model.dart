import 'package:nawy_task/features/search/business/entities/unit_entity.dart';
import 'package:nawy_task/features/search/data/models/unit_sub_model.dart';

class UnitModel extends UnitEntity {
  const UnitModel({
    required int id,
    required int minPrice,
    required String name,
    required String image,
    required String readyByDate,
    required PropertyTypeModel propertyType,
    required CompoundDetailsModel compoundDetails,
    required DeveloperModel developer,
  }) : super(
          id: id,
          minPrice: minPrice,
          name: name,
          image: image,
          readyByDate: readyByDate,
          propertyType: propertyType,
          compoundDetails: compoundDetails,
          developer: developer,
        );

  factory UnitModel.fromJson(Map<String, dynamic> json) {
    return UnitModel(
      id: json["id"],
      minPrice: json["min_price"],
      name: json["name"],
      image: json["image"] ?? '',
      readyByDate: json["min_ready_by"],
      propertyType: PropertyTypeModel.fromJson(json["property_type"]),
      compoundDetails: CompoundDetailsModel.fromJson(json["compound"]),
      developer: DeveloperModel.fromJson(json["developer"]),
    );
  }
}
