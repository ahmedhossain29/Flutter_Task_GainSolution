import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_gain_solution/features/profile/presentation/cubit/profile_state.dart';

import '../../domain/usecases/get_profile.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetProfile getProfile;

  ProfileCubit(this.getProfile) : super(ProfileInitial());

  Future<void> fetchProfile() async {
    emit(ProfileLoading());

    try {
      final data = await getProfile();
      emit(ProfileLoaded(data));
    } catch (_) {
      emit(ProfileError());
    }
  }
}
