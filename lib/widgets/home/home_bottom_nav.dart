import 'package:flutter/material.dart';

class HomeBottomNav extends StatelessWidget {
  const HomeBottomNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashFactory: NoSplash.splashFactory,
        highlightColor: Theme.of(context).colorScheme.surface,
      ), 
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.history
            ),
            label: 'History'
          )
        ]
      ),
    );
  }
}