import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task_gain_solution/features/home/presentation/widgets/main_controller.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/k_images.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MainController();
    return Container(
      height: Platform.isAndroid ? 100 : 110,
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF000000).withOpacity(0.12), //#0000001F
              blurRadius: 40.0,
              offset: const Offset(0, 4),
              spreadRadius: 0,
            ),
          ]
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        child: StreamBuilder(
          initialData: 0,
          stream: controller.naveListener.stream,
          builder: (_, AsyncSnapshot<int> index) {
            int selectedIndex = index.data ?? 0;
            return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: _navIcon(KImages.ticketIcon),
                  activeIcon: _navIcon(KImages.ticketIconActive),
                  label: 'Tickets'
                ),
                BottomNavigationBarItem(
                  icon: _navIcon(KImages.contactIcon),
                  activeIcon: _navIcon(KImages.contactIconActive),
                  label: 'Contacts',
                ),
                BottomNavigationBarItem(
                  icon: _navIcon(KImages.profileIcon),
                  activeIcon: _navIcon(KImages.profileIconActive),
                  label: 'Profile',
                ),

              ],
              // type: BottomNavigationBarType.fixed,
              currentIndex: selectedIndex,
              onTap: (int index) {
                controller.naveListener.sink.add(index);
              },
            );
          },
        ),
      ),
    );
  }

  Widget _navIcon(String path) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SvgPicture.asset(path));
}

