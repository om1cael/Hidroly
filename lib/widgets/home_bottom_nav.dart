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
        highlightColor: Color(0xff31333A),
      ), 
      child: BottomNavigationBar(
        backgroundColor: Color(0xff1B1E26),
        selectedItemColor: Colors.white,
        unselectedItemColor: Color.fromARGB(255, 87, 91, 105),
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