import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField({super.key,this.onChanged ,this.hintText,this.obscureText =false});

  @override
  String? hintText;  
  bool obscureText ;
  Function(String)? onChanged;      
  Widget build(BuildContext context) {

    return TextFormField(
        obscureText:obscureText!,
      validator: (value) {
         if(value!.isEmpty){
           return 'Filed Is Empty' ;
         }
      },
      onChanged: onChanged,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.white,
        ),
        
        enabledBorder:OutlineInputBorder(
          borderSide: BorderSide(
            color:Colors.white,
          ),
        ) ,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color:Colors.white,
          ),
        ),
       
      ),

    );
  }
}
