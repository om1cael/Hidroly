import 'package:flutter/material.dart';
import 'package:hidroly/controller/home_controller.dart';
import 'package:hidroly/model/User.dart';
import 'package:hidroly/model/water_button.dart';
import 'package:hidroly/pages/setup_page.dart';
import 'package:hidroly/theme/app_colors.dart';
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

  @override
  void initState() {
    super.initState();
    _loadUser();
    _loadCustomCups();
  }

  @override
  Widget build(BuildContext context) {
    if(homeController.user == null) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator(),),
      );
    }

    return Scaffold(
      appBar: appBar(),
      bottomNavigationBar: HomeBottomNav(),
      body: Center(
        child: Column(
          spacing: 50,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WaterProgressCircle(user: homeController.user!,),
            WaterActionButtons(
              homeController: homeController,
              customCups: homeController.customCups ?? [],
              onUpdate: () => setState(() {}),
            )
          ],
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
        'Today',
      ),
      actions: [
        IconButton(
          onPressed: () {}, 
          icon: Icon(
            Icons.settings, 
            color: AppColors.primaryText,
          ),
          style: IconButton.styleFrom(
            backgroundColor: Colors.transparent,
          ),
        )
      ],
    );
  }

  void _loadUser() async {
    await homeController.loadUser();
    if(homeController.user == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SetupPage()),
      );
      return;
    }

    setState(() {});
  }

  void _loadCustomCups() async {
    await homeController.loadCustomCups();
    setState(() {});
  }
}