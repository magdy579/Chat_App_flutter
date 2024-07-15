import 'package:chatapp/models/massege.dart';
import 'package:flutter/material.dart';

import '../constes/constk.dart';

class ChatWeadget extends StatelessWidget {
   ChatWeadget({
    super.key, required this.message
  });
     final Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.only(left: 12,top:26,bottom: 26,right: 12),        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft:  Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight:  Radius.circular(32),
          ),

          color: kprimaryColor,
        ),

        child: Text(
          message.message,
          style: TextStyle(
            color:Colors.white,
          ),
        ),
      ),
    );
  }
}
class ChatWeadget1 extends StatelessWidget {
  ChatWeadget1({
    super.key, required this.message
  });
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.only(left: 12,top:26,bottom: 26,right: 12),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft:  Radius.circular(32),
            topRight: Radius.circular(32),
            bottomLeft:  Radius.circular(32),
          ),

          color: Color(0xff006184) ,
        ),

        child: Text(
          message.message,
          style: TextStyle(
            color:Colors.white,
          ),
        ),
      ),
    );
  }
}