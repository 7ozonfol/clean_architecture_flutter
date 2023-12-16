import 'package:dio/dio.dart';
import 'package:nawy_task/core/params/params.dart';
import 'package:nawy_task/features/search/data/models/unit_model.dart';

import '../../../../core/errors/exceptions.dart';

abstract class UnitDataSource {
  Future<List<UnitModel>> getUnit({required SearchParams params});
}

class UnitDataSourceImpl implements UnitDataSource {
  final Dio dio;

  UnitDataSourceImpl({required this.dio});

  @override
  Future<List<UnitModel>> getUnit({required SearchParams params}) async {
    final response = await dio.post(
      'https://website-api.testing.kafrelmatloob.com/api/properties/search',
      data: params,
      options: Options(contentType: Headers.textPlainContentType),
    );

    if (response.statusCode == 200) {
      List<UnitModel> unitList = List<UnitModel>.from(
          response.data['values'].map((e) => UnitModel.fromJson(e)));
      return Future.value(unitList);
    } else {
      throw ServerException();
    }
  }
}
