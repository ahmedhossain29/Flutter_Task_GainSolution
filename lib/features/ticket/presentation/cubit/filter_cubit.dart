import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_filters.dart';
import 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  final GetFilters getFilters;

  FilterCubit(this.getFilters) : super(FilterInitial());

  Future<void> fetchFilters() async {
    emit(FilterLoading());

    try {
      final data = await getFilters();
      emit(FilterLoaded(data));
    } catch (_) {
      emit(FilterError());
    }
  }
}
