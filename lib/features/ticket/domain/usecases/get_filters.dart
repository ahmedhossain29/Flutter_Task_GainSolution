import '../entities/filter_data.dart';
import '../repositories/filter_repository.dart';

class GetFilters {
  final FilterRepository repository;

  GetFilters(this.repository);

  Future<FilterData> call() {
    return repository.getFilters();
  }
}
