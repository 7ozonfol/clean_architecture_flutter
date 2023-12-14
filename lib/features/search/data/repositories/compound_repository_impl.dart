import 'package:dartz/dartz.dart';
import 'package:nawy_task/features/search/business/entities/compound_entity.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../business/repositories/compound_repository.dart';
import '../dataSources/compounds_data_source.dart';

class CompoundRepositoryImpl extends CompoundRepository {
  final CompoundsDataSource compoundDataSource;

  CompoundRepositoryImpl({required this.compoundDataSource});

  @override
  Future<Either<Failure, List<CompoundEntity>>> getCompounds() async {
    try {
      final result = await compoundDataSource.getCompounds();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure(errorMessage: 'This is a server exception'));
    }
  }
}
