import 'package:dartz/dartz.dart';
import 'package:nawy_task/core/params/params.dart';
import 'package:nawy_task/features/search/business/repositories/unit_repository.dart';
import 'package:nawy_task/features/search/data/dataSources/unit_data_source.dart';
import 'package:nawy_task/features/search/data/models/unit_model.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';

class UnitRepositoryImpl extends UnitRepository {
  final UnitDataSource unitDataSource;

  UnitRepositoryImpl({required this.unitDataSource});

  @override
  Future<Either<Failure, List<UnitModel>>> getUnit(
      {required SearchParams params}) async {
    try {
      final result = await unitDataSource.getUnit(params: params);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure(errorMessage: 'This is a server exception'));
    }
  }
}
