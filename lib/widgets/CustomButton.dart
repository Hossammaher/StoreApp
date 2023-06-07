import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({this.onTap,required this.buttonName});

  String buttonName ;
  VoidCallback? onTap ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(8)
          ),
          child: Center(child: Text(buttonName,style: TextStyle(fontSize: 24),)),


        ),
      ),
    );
  }


}
