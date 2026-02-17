import 'package:get_it/get_it.dart';

import '../../features/contact/data/datasources/contact_local_datasources.dart';
import '../../features/contact/data/repositories/contact_repository_impl.dart';
import '../../features/contact/domain/repositories/contact_repository.dart';
import '../../features/contact/domain/usecase/get_contacts.dart';
import '../../features/contact/presentation/cubit/contact_cubit.dart';
import '../../features/profile/data/datasources/profile_local_datasource.dart';
import '../../features/profile/data/repositories/profile_repository_impl.dart';
import '../../features/profile/domain/repositories/profile_repository.dart';
import '../../features/profile/domain/usecases/get_profile.dart';
import '../../features/profile/presentation/cubit/profile_cubit.dart';
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


  /// CONTACT DATASOURCE
  sl.registerLazySingleton<ContactLocalDataSource>(
        () => ContactLocalDataSource(),
  );

  /// CONTACT REPOSITORY
  sl.registerLazySingleton<ContactRepository>(
        () => ContactRepositoryImpl(sl()),
  );

  /// CONTACT USECASE
  sl.registerLazySingleton<GetContacts>(
        () => GetContacts(sl()),
  );

  /// CONTACT CUBIT
  sl.registerFactory<ContactCubit>(
        () => ContactCubit(sl()),
  );

/// profile
  sl.registerLazySingleton<ProfileLocalDataSource>(
        () => ProfileLocalDataSource(),
  );

  sl.registerLazySingleton<ProfileRepository>(
        () => ProfileRepositoryImpl(sl()),
  );

  sl.registerLazySingleton<GetProfile>(
        () => GetProfile(sl()),
  );

  sl.registerFactory<ProfileCubit>(
        () => ProfileCubit(sl()),
  );

}
