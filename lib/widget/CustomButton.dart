import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
   CustomButton({this.onTap,required this.textButton});

  @override
  String textButton;
   VoidCallback? onTap;
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Container(
        width: double.infinity,
        height: 40,

        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(9),
        ),
        child: Center(
          child: Text(
              textButton
          ),
        ),
      ),
    ) ;
  }
}
