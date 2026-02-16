import '../entities/filter_data.dart';

abstract class FilterRepository {
  Future<FilterData> getFilters();
}
