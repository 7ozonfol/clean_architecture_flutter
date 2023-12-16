import 'package:dartz/dartz.dart';
import 'package:nawy_task/core/errors/failure.dart';
import 'package:nawy_task/features/search/business/repositories/area_repository.dart';
import 'package:nawy_task/features/search/data/dataSources/areas_data_source.dart';
import 'package:nawy_task/features/search/data/models/area_model.dart';

import '../../../../core/errors/exceptions.dart';

class AreaRepositoryImpl extends AreaRepository {
  final AreaDataSource areaDataSource;

  AreaRepositoryImpl({required this.areaDataSource});

  @override
  Future<Either<Failure, List<AreaModel>>> getAreas() async {
    try {
      final result = await areaDataSource.getArea();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure(errorMessage: 'This is a server exception'));
    }
  }
}
