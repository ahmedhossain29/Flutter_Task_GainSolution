import 'package:get_it/get_it.dart';

import '../../features/ticket/data/datasources/filter_local_datasource.dart';
import '../../features/ticket/data/datasources/ticket_local_datasource.dart';
import '../../features/ticket/data/repositories/filter_repository_impl.dart';
import '../../features/ticket/data/repositories/ticket_repository_impl.dart';
import '../../features/ticket/domain/repositories/filter_repository.dart';
import '../../features/ticket/domain/repositories/ticket_repository.dart';
import '../../features/ticket/domain/usecases/get_filters.dart';
import '../../features/ticket/domain/usecases/get_tickets.dart';
import '../../features/ticket/presentation/cubit/filter_cubit.dart';
import '../../features/ticket/presentation/cubit/ticket_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// DATA SOURCE
  sl.registerLazySingleton<TicketLocalDataSource>(
        () => TicketLocalDataSource(),
  );

  /// REPOSITORY
  sl.registerLazySingleton<TicketRepository>(
        () => TicketRepositoryImpl(sl()),
  );

  /// USECASE
  sl.registerLazySingleton<GetTickets>(
        () => GetTickets(sl()),
  );

  /// CUBIT
  sl.registerFactory<TicketCubit>(
        () => TicketCubit(sl()),
  );


  /// FILTER DATASOURCE
  sl.registerLazySingleton<FilterLocalDataSource>(
        () => FilterLocalDataSource(),
  );

  /// FILTER REPOSITORY
  sl.registerLazySingleton<FilterRepository>(
        () => FilterRepositoryImpl(sl()),
  );

  /// FILTER USECASE
  sl.registerLazySingleton<GetFilters>(
        () => GetFilters(sl()),
  );

  /// FILTER CUBIT
  sl.registerFactory<FilterCubit>(
        () => FilterCubit(sl()),
  );

}
