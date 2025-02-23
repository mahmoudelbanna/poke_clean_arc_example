import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key, required ValueNotifier<int> currentPageIndex})
    : _currentPageIndex = currentPageIndex;

  final ValueNotifier<int> _currentPageIndex;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      onDestinationSelected: (int index) {
        _currentPageIndex.value = index;
      },
      indicatorColor: Colors.amber,
      selectedIndex: _currentPageIndex.value,
      destinations: const <Widget>[
        NavigationDestination(
          icon: Icon(Icons.search_outlined),
          label: 'Search',
        ),
        NavigationDestination(icon: Icon(Icons.menu), label: 'Pokemon'),
      ],
    );
  }
}
