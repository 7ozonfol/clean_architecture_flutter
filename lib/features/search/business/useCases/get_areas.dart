import 'package:dartz/dartz.dart';
import 'package:nawy_task/features/search/business/entities/area_entity.dart';
import 'package:nawy_task/features/search/business/repositories/area_repository.dart';

import '../../../../core/errors/failure.dart';

class GetAreas {
  final AreaRepository repository;

  GetAreas(this.repository);

  Future<Either<Failure, List<AreaEntity>>> call() async {
    return await repository.getAreas();
  }
}
