import 'package:flutter/material.dart';
import 'package:hidroly/controller/home_controller.dart';
import 'package:hidroly/model/User.dart';
import 'package:hidroly/model/water_button.dart';
import 'package:hidroly/theme/app_colors.dart';
import 'package:hidroly/widgets/input/form_number_input_field.dart';

class WaterActionButtons extends StatelessWidget {
  final TextEditingController customCupAmountController;
  final GlobalKey<FormState> formKey;

  final HomeController homeController;
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
    required this.customCupAmountController,
    required this.formKey,
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
                _showCustomCupPopUp(context);
                return;
              }

              await _updateWaterIntake(button);
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
            ),
            label: Text(
              button.isCustomOption == false 
              ? '${button.amount}ml' : 'Custom',
              style: TextStyle(
                color: AppColors.secondaryText
              ),
            ),
          );
        }, 
        separatorBuilder: (context, index) => SizedBox(width: 10,), 
        itemCount: allButtons.length
      ),
    );
  }

  void _showCustomCupPopUp(context) {
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: Text(
          'Add Custom Cup',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        content: Form(
          key: formKey,
          child: FormNumberInputField(
            label: 'Amount', 
            controller: customCupAmountController, 
            validator: (value) {
              int? amount = int.tryParse(value ?? '');
              if(amount == null || amount <= 0) return 'Invalid amount.';
              return null;
            }
          ),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              bool created = await homeController.createCustomCup(
                customCupAmountController.text
              );

              if(created) {
                onUpdate();
              }
            }, 
            child: Text(
              'Add',
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context), 
            child: Text(
              'Cancel',
            ),
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.surface,
      )
    );
  }

  Future<void> _updateWaterIntake(WaterButton button) async {
    User currentUser = homeController.user!;
    User updatedUser = User(
      id: currentUser.id, 
      dailyGoal: currentUser.dailyGoal, 
      currentAmount: currentUser.currentAmount + button.amount
    );
    await homeController.updateUser(updatedUser);
    onUpdate();
  }
}