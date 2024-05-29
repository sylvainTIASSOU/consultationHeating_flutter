import 'package:flutter/material.dart';

import '../constants.dart';
class BottomReusableRow extends StatelessWidget {
  const BottomReusableRow({super.key, required this.icon, required this.valueText, required this.unitText});
  final IconData? icon;
  final String valueText;
  final String unitText;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: icon != null?MainAxisAlignment.center:MainAxisAlignment.start,
        children: [
          icon != null?Icon(icon,color: kGoldenColor,size: 30,):SizedBox(),
          SizedBox(width: 10,),
          Text(valueText,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 45,color: kTextGrayColor),),
          SizedBox(width: 10,),
          Text(unitText,style: TextStyle(fontSize: 20),)
        ],
      ),
    );
  }
}
