import '../../domain/entities/filter_data.dart';
import '../../domain/repositories/filter_repository.dart';
import '../datasources/filter_local_datasource.dart';

class FilterRepositoryImpl implements FilterRepository {
  final FilterLocalDataSource localDataSource;

  FilterRepositoryImpl(this.localDataSource);

  @override
  Future<FilterData> getFilters() {
    return localDataSource.getFilters();
  }
}
