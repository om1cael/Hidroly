import 'package:flutter/material.dart';
import 'package:hidroly/controller/home_controller.dart';
import 'package:hidroly/database/database_helper.dart';
import 'package:hidroly/model/User.dart';
import 'package:hidroly/model/water_button.dart';

class WaterActionButtons extends StatelessWidget {
  HomeController homeController;
  final VoidCallback onUpdate;

  List<WaterButton> get defaultButtons => [
    WaterButton(amount: 250),
    WaterButton(amount: 350)
  ];

  List<WaterButton> customCups;

  WaterButton get customAddButton => WaterButton(amount: 0, isCustomOption: true);

  List<WaterButton> get allButtons => [
    ...defaultButtons,
    ...customCups,
    customAddButton,
  ];

  WaterActionButtons({
    super.key,
    required this.homeController,
    required this.customCups,
    required this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: EdgeInsets.only(left: 15, right: 15),
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var button = allButtons[index];

          return ElevatedButton.icon(
            onPressed: () async {
              if(button.isCustomOption) {
                return;
              }

              User currentUser = homeController.user!;
              User updatedUser = User(id: currentUser.id, dailyGoal: currentUser.dailyGoal, currentAmount: currentUser.currentAmount + button.amount);
              await homeController.updateUser(updatedUser);
              onUpdate();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff31333A),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(16)
              ),
            ),
            icon: Icon(
              button.isCustomOption == false 
              ? Icons.ac_unit : Icons.add,
              color: Color(0xffF9F9F9),
            ),
            label: Text(
              button.isCustomOption == false 
              ? '${button.amount}ml' : 'Custom',
              style: TextStyle(
                color: Color(0xffF9F9F9),
              ),
            ),
          );
        }, 
        separatorBuilder: (context, index) => SizedBox(width: 10,), 
        itemCount: allButtons.length
      ),
    );
  }
}