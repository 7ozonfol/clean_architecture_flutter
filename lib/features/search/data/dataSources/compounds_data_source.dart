import 'package:dio/dio.dart';

import '../../../../core/errors/exceptions.dart';
import '../models/compound_model.dart';

abstract class CompoundsDataSource {
  Future<List<CompoundModel>> getCompounds();
}

class CompoundsDataSourceImpl implements CompoundsDataSource {
  final Dio dio;

  CompoundsDataSourceImpl({required this.dio});

  @override
  Future<List<CompoundModel>> getCompounds() async {
    final response = await dio
        .get('https://website-api.testing.kafrelmatloob.com/api/compounds');

    if (response.statusCode == 200) {
      List<CompoundModel> compoundsList = List<CompoundModel>.from(
          response.data.map((e) => CompoundModel.fromJson(e)));
      return Future.value(compoundsList);
    } else {
      throw ServerException();
    }
  }
}
