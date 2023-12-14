import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/area_entity.dart';

abstract class AreaRepository {
  Future<Either<Failure, List<AreaEntity>>> getAreas();
}
