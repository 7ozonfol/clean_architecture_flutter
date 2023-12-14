import 'package:nawy_task/features/search/business/entities/filter_option.dart';

class FilterOptionModel extends FilterOptionEntity {
  const FilterOptionModel({
    required List<int> priceList,
  }) : super(priceList: priceList);

  factory FilterOptionModel.fromJson(Map<String, dynamic> json) {
    return FilterOptionModel(
      priceList: List<int>.from(json["price_list"]),
    );
  }
}
