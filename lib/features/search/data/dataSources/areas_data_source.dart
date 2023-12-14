import 'package:nawy_task/features/search/data/models/area_model.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/exceptions.dart';

abstract class AreaDataSource {
  Future<List<AreaModel>> getArea();
}

class AreaDataSourceImpl implements AreaDataSource {
  final Dio dio;

  AreaDataSourceImpl({required this.dio});

  @override
  Future<List<AreaModel>> getArea() async {
    final response = await dio
        .get('https://website-api.testing.kafrelmatloob.com/api/areas');

    if (response.statusCode == 200) {
      List<AreaModel> areaList =
          List<AreaModel>.from(response.data.map((e) => AreaModel.fromJson(e)));
      return Future.value(areaList);
    } else {
      throw ServerException();
    }
  }
}
