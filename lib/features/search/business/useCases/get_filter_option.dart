import 'package:dartz/dartz.dart';
import 'package:nawy_task/features/search/business/entities/filter_option.dart';
import 'package:nawy_task/features/search/business/repositories/filter_option_repository.dart';

import '../../../../core/errors/failure.dart';

class GetFilterOption {
  final FilterOptionRepository repository;

  GetFilterOption(this.repository);

  Future<Either<Failure, FilterOptionEntity>> call() async {
    return await repository.getFilterOptions();
  }
}
