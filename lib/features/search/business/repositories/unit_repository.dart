import 'package:dartz/dartz.dart';
import 'package:nawy_task/core/params/params.dart';
import 'package:nawy_task/features/search/business/entities/unit_entity.dart';

import '../../../../core/errors/failure.dart';

abstract class UnitRepository {
  Future<Either<Failure, List<UnitEntity>>> getUnit(
      {required SearchParams params});
}
