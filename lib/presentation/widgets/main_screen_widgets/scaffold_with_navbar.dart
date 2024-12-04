import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavbar extends StatelessWidget {
  const ScaffoldWithNavbar(this.navigationShell, {super.key});

  /// The navigation shell and container for the branch Navigators.
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        selectedIndex: navigationShell.currentIndex,
        destinations: [
          NavigationDestination(
            icon: SvgPicture.asset('assets/icons/home.svg'),
            label: 'Home',
          ),
          NavigationDestination(
            icon: SvgPicture.asset('assets/icons/circle.svg'),
            label: 'Circles',
          ),
          NavigationDestination(
            icon: SvgPicture.asset('assets/icons/events.svg'),
            label: 'Events',
          ),NavigationDestination(
            icon: SvgPicture.asset('assets/icons/exercises.svg'),
            label: 'exercises',
          ),
          NavigationDestination(
            icon: SvgPicture.asset('assets/icons/profile.svg'),
            label: 'Profile',
          ),
        ],
        onDestinationSelected: _onTap,
      ),
    );
  }

  void _onTap(index) {
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}