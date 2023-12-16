import 'package:nawy_task/features/search/business/entities/unit_sub_entities.dart';

class UnitEntity {
  final int id;
  final int minPrice;
  final String name;
  final String image;
  final String readyByDate;
  final PropertyTypeEntity propertyType;
  final CompoundDetailsEntity compoundDetails;
  final DeveloperEntity developer;

  const UnitEntity(
      {required this.id,
      required this.minPrice,
      required this.name,
      required this.image,
      required this.readyByDate,
      required this.propertyType,
      required this.compoundDetails,
      required this.developer});
}
