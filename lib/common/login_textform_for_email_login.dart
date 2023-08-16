import 'package:best_seller/constant/const.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class LoginTextFormForEmailLogin extends StatelessWidget {
   LoginTextFormForEmailLogin({
    super.key,
    required this.prefixIcon,
    required this.hintText,
    this.passdot=false,
    required this.controller,
  });

   IconData prefixIcon;
   String hintText;
   bool passdot;
   TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
   
    return Padding(
      padding:  EdgeInsets.only(left: width /15, right: width/15),
      child: TextFormField(
        validator: (value) => value!.isEmpty ?"Please enter your email":null,
        controller: controller,
        obscureText: passdot,
        onTapOutside: (event) {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: const BorderSide(
              color: logoBlue,
            ),
          ),
          prefixIcon: Icon(
            prefixIcon,
            color: const Color(0xFF00B212D),
          ),
          hintText: hintText,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
        ),
        cursorColor: Color(0xFF00B212D),
      ),
    );
  }
}
