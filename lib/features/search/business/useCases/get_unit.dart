import 'package:dartz/dartz.dart';
import 'package:nawy_task/core/params/params.dart';
import 'package:nawy_task/features/search/business/entities/unit_entity.dart';
import 'package:nawy_task/features/search/business/repositories/unit_repository.dart';

import '../../../../core/errors/failure.dart';

class GetUnit {
  final UnitRepository repository;

  GetUnit(this.repository);

  Future<Either<Failure, List<UnitEntity>>> call(
      {required SearchParams params}) async {
    return await repository.getUnit(params: params);
  }
}
