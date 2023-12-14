import 'package:dartz/dartz.dart';
import 'package:nawy_task/features/search/business/repositories/filter_option_repository.dart';
import 'package:nawy_task/features/search/data/models/filter_option_model.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../dataSources/filter_option_data_source.dart';

class FilterOptionRepositoryImpl extends FilterOptionRepository {
  final FilterOptionsDataSource filterOptionDataSource;

  FilterOptionRepositoryImpl({required this.filterOptionDataSource});

  @override
  Future<Either<Failure, FilterOptionModel>> getFilterOptions() async {
    try {
      final result = await filterOptionDataSource.getFilterOptions();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure(errorMessage: 'This is a server exception'));
    }
  }
}
