import 'package:dartz/dartz.dart';
import 'package:nawy_task/features/search/business/entities/compound_entity.dart';
import 'package:nawy_task/features/search/business/repositories/compound_repository.dart';

import '../../../../core/errors/failure.dart';

class GetCompounds {
  final CompoundRepository repository;

  GetCompounds(this.repository);

  Future<Either<Failure, List<CompoundEntity>>> call() async {
    return await repository.getCompounds();
  }
}
