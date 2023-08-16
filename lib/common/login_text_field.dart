import 'package:best_seller/constant/const.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginTextForm extends StatefulWidget {
  LoginTextForm({
    super.key,
    required this.prefixIcon,
    required this.hintText,
    this.passwordVisiblity = false,
    required this.controller,
    this.suf,
    this.sufV,
    // required this.validation
  });
// String Function(String?) validation;
  IconData prefixIcon;
  String hintText;
  bool passwordVisiblity = false;
  TextEditingController controller;
  IconData? suf;
  IconData? sufV;

  @override
  State<LoginTextForm> createState() => _LoginTextFormState();
}

class _LoginTextFormState extends State<LoginTextForm> {
  // bool passwordVisiblity = false;

  // @override
  // void initState() {
  //   super.initState();
  //   widget.passwordVisiblity = true;
  // }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.only(left: width / 15, right: width / 15),
      child: TextFormField(
        // validator:widget.validation,
        validator: (value) =>
            value!.isEmpty ? "Please enter your password" : null,

        controller: widget.controller,
        obscureText: widget.passwordVisiblity,
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
            widget.prefixIcon,
            color: const Color(0xFF00B212D),
          ),
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  widget.passwordVisiblity = !widget.passwordVisiblity;
                });
              },
              icon: Icon(
                widget.passwordVisiblity ? widget.sufV : widget.suf,
                color: widget.passwordVisiblity
                    ? const Color(0xFF00B212D)
                    : logoRed,
              )),
          hintText: widget.hintText,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
        ),
        cursorColor: const Color(0xFF00B212D),
      ),
    );
  }
}
