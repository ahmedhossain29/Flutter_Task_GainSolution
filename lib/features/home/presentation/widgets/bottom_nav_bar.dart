import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_task_gain_solution/features/home/presentation/widgets/main_controller.dart';
import '../../../../core/utils/app_color.dart';


class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MainController();

    return Container(
      height: Platform.isAndroid ? 100 : 110,
      decoration: BoxDecoration(
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF000000).withOpacity(0.12),
            blurRadius: 20,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: StreamBuilder<int>(
        initialData: 0,
        stream: controller.naveListener.stream,
        builder: (_, snapshot) {
          final selectedIndex = snapshot.data ?? 0;

          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: selectedIndex,
            onTap: controller.naveListener.sink.add,

            backgroundColor: Colors.transparent,
            elevation: 0,

            selectedItemColor: const Color(0xFF3B3B3B),
            unselectedItemColor: const Color(0xFF3B3B3B),

            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,

            ),
            unselectedLabelStyle: const TextStyle(fontSize: 11,
              fontWeight: FontWeight.w500,),

            items: [
              _item(
                icon: Icons.confirmation_number_outlined,
                activeIcon: Icons.confirmation_number,
                label: 'Tickets',
                selected: selectedIndex == 0,
              ),
              _item(
                icon: Icons.people_outline,
                activeIcon: Icons.people,
                label: 'Contacts',
                selected: selectedIndex == 1,
              ),
              _item(
                icon: Icons.person_outline,
                activeIcon: Icons.person,
                label: 'Profile',
                selected: selectedIndex == 2,
              ),
            ],
          );
        },
      ),
    );
  }

  BottomNavigationBarItem _item({
    required IconData icon,
    required IconData activeIcon,
    required String label,
    required bool selected,
  }) {
    return BottomNavigationBarItem(
      label: label,
      icon: _pillIcon(icon, selected: false),
      activeIcon: _pillIcon(activeIcon, selected: true),
    );
  }

  /// 🔹 pill background for selected tab
  Widget _pillIcon(IconData icon, {required bool selected}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? const Color(0xFFE6F6FC) : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Icon(
        icon,
        size: 22,
        color: selected ? const Color(0xFF2F80ED) : Colors.grey,
      ),
    );
  }
}


