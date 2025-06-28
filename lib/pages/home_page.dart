import 'package:flutter/material.dart';
import 'package:hidroly/controller/home_controller.dart';
import 'package:hidroly/model/User.dart';
import 'package:hidroly/pages/setup_page.dart';
import 'package:hidroly/widgets/home/home_bottom_nav.dart';
import 'package:hidroly/widgets/home/water_action_buttons.dart';
import 'package:hidroly/widgets/home/water_progress_circle.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController = HomeController();
  User? user;

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  @override
  Widget build(BuildContext context) {
    if(user == null) {
      return Scaffold(
        backgroundColor: Color(0xff1E1E1E),
        body: Center(child: CircularProgressIndicator(),),
      );
    }

    return Scaffold(
      appBar: appBar(),
      bottomNavigationBar: HomeBottomNav(),
      backgroundColor: Color(0xff1E1E1E),
      body: Center(
        child: Column(
          spacing: 50,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WaterProgressCircle(user: user!,),
            WaterActionButtons()
          ],
        ),
      ),
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

  void _loadUser() async {
    user = await homeController.loadUser();
    if(user == null) {
      if(!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SetupPage()),
      );
      return;
    }

    setState(() {});
  }
}