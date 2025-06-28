import 'package:flutter/material.dart';
import 'package:hidroly/model/water_button.dart';

class WaterActionButtons extends StatelessWidget {

  List<WaterButton> get defaultButtons => [
    WaterButton(amount: 250),
    WaterButton(amount: 350)
  ];

  WaterButton get customAddButton => WaterButton(amount: 0, isCustomOption: true);

  List<WaterButton> get allButtons => [
    ...defaultButtons,
    customAddButton,
  ];

  const WaterActionButtons({
    super.key,
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
            onPressed: () {
              if(button.isCustomOption) print('custom button');
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
              ? '${allButtons[index].amount}ml' : 'Custom',
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