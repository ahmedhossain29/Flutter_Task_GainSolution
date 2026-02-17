import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_gain_solution/core/common_widgets/custom_text.dart';
import 'package:flutter_task_gain_solution/core/utils/app_color.dart';
import 'package:flutter_task_gain_solution/features/profile/presentation/screen/widgets/loaded_profile_view.dart';

import '../../../../core/di/injector.dart';
import '../cubit/profile_cubit.dart';
import '../cubit/profile_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ProfileCubit>()..fetchProfile(),
      child: const _ProfileView(),
    );
  }
}

class _ProfileView extends StatelessWidget {
  const _ProfileView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: CustomText(
          text: "My Profile",
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (_, state) {
          if (state is ProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ProfileError) {
            return const Center(child: Text("Failed to load profile"));
          }

          if (state is ProfileLoaded) {
            return LoadedProfileView(profile: state.profile);
          }

          return const SizedBox();
        },
      ),
    );
  }
}
