import 'package:dartz/dartz.dart';
import 'package:nawy_task/features/search/business/entities/compound_entity.dart';

import '../../../../core/errors/failure.dart';

abstract class CompoundRepository {
  Future<Either<Failure, List<CompoundEntity>>> getCompounds();
}
