import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/filter_option.dart';

abstract class FilterOptionRepository {
  Future<Either<Failure, FilterOptionEntity>> getFilterOptions();
}
