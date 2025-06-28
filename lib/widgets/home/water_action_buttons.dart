import 'package:flutter/material.dart';

class WaterActionButtons extends StatelessWidget {
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
          return ElevatedButton.icon(
            onPressed: () => {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff31333A),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(16)
              ),
            ),
            icon: Icon(
              Icons.add,
              color: Color(0xffF9F9F9),
            ),
            label: Text(
              '300ml',
              style: TextStyle(
                color: Color(0xffF9F9F9),
              ),
            ),
          );
        }, 
        separatorBuilder: (context, index) => SizedBox(width: 10,), 
        itemCount: 3
      ),
    );
  }
}