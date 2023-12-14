import 'package:dio/dio.dart';
import 'package:nawy_task/features/search/data/models/filter_option_model.dart';

import '../../../../core/errors/exceptions.dart';

abstract class FilterOptionsDataSource {
  Future<FilterOptionModel> getFilterOptions();
}

class FilterOptionsDataSourceImpl implements FilterOptionsDataSource {
  final Dio dio;

  FilterOptionsDataSourceImpl({required this.dio});

  @override
  Future<FilterOptionModel> getFilterOptions() async {
    final response = await dio.get(
        'https://website-api.testing.kafrelmatloob.com/api/properties/get_filter_options');

    if (response.statusCode == 200) {
      return FilterOptionModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}
