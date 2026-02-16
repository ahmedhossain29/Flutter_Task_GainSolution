import '../../domain/entities/filter_data.dart';

abstract class FilterState {}

class FilterInitial extends FilterState {}

class FilterLoading extends FilterState {}

class FilterLoaded extends FilterState {
  final FilterData data;

  FilterLoaded(this.data);
}

class FilterError extends FilterState {}
