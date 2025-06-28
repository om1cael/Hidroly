import 'package:flutter/material.dart';
import 'package:hidroly/widgets/home_bottom_nav.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      bottomNavigationBar: HomeBottomNav(),
      backgroundColor: Color(0xff1E1E1E),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
        'Today',
        style: TextStyle(
          color: Color(0xffF9F9F9),
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {}, 
          icon: Icon(
            Icons.settings, 
            color: Color(0xffF9F9F9),
          ),
        )
      ],
      backgroundColor: Color(0xff1E1E1E),
    );
  }
}