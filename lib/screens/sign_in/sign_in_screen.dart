import 'dart:developer';

import 'package:best_seller/services/api_service.dart';
import 'package:best_seller/common/login_text_field.dart';
import 'package:best_seller/common/login_textform_for_email_login.dart';
import 'package:best_seller/constant/const.dart';
import 'package:best_seller/navbar/animated_bottom.dart';
import 'package:best_seller/providers/auth_provider.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController controllerEmail = TextEditingController();

  final TextEditingController controllerPassword = TextEditingController();
//  final GlobalKey _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late SharedPreferences prefs;

  void initState() {
    super.initState();
    initSharedPref();
  }

  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: height / 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //     Image.asset(
                  //   'asset/Best Express Cargo logo.png',
                  //   // width: 800.w,
                  //   // height: 600.h,
                  //   scale: 2,
                  // ),
                  Text(
                    "Sign In",
                    style: GoogleFonts.baloo2(
                        fontSize: 30, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
              SizedBox(height: height / 30),
              Image.asset(
                'asset/Best Express Cargo logo.png',
                // width: 800.w,
                // height: 600.h,
                // scale: 12,
              ),

              SizedBox(
                height: height / 3,
                child: Image.asset(
                  'asset/techny-international-transportation-and-delivery-logistics.gif',
                  // width: 800.w,
                  // height: 600.h,
                  // scale: 2,
                ),
              ),
              // kFormField100,
              SizedBox(
                height: height / 100,
              ),
              LoginTextFormForEmailLogin(
                  prefixIcon: Icons.email,
                  hintText: "Email or Phone",
                  controller: controllerEmail),
              SizedBox(height: height / 80),
              LoginTextForm(
                prefixIcon: Icons.lock,
                hintText: "Password",
                passwordVisiblity: true,
                controller: controllerPassword,
                suf: Icons.visibility,
                sufV: Icons.visibility_off,
              ),

              // kFormField100,
              SizedBox(
                height: height / 30,
              ),
              SizedBox(
                height: height / 18,
                width: width / 1.5,
                child: ElevatedButton(
                  onPressed: () {
                    // Map creds = {
                    //   'email': controllerEmail,
                    //   'password' : controllerPassword,
                    //   // 'device_name' : 'mobile',

                    // };
                    if (_formKey.currentState != null &&
                        _formKey.currentState!.validate()) {
                      // log(creds.toString());
                      Provider.of<AuthStateManagement>(context, listen: false)
                          .login(controllerEmail.text, controllerPassword.text,context);
                          // .then(
                          //   (value) => Navigator.of(context).pushReplacement(
                          //     MaterialPageRoute(
                          //       builder: (context) =>
                          //           const AnimatedBottomNavBar(),
                          //     ),
                          //   ),
                          // );
                    }

                    // AttendenceApi().loginApi(
                    //     controllerEmail, controllerPassword, prefs, context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: logoBlue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  child: const Text(
                    "Sign In",
                    style: TextStyle(fontSize: 18, color: whiteShade),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
