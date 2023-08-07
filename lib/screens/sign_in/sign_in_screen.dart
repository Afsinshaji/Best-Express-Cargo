import 'package:best_seller/common/login_text_field.dart';
import 'package:best_seller/common/login_textform_for_email_login.dart';
import 'package:best_seller/constant/const.dart';
import 'package:best_seller/navbar/bottomnavbar.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _controllerEmail = TextEditingController();

  final TextEditingController _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height / 10),
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
                  style: GoogleFonts.raleway(
                      fontSize: 40, fontWeight: FontWeight.w800),
                ),
              ],
            ),
            SizedBox(height: height / 22),
            Image.asset(
              'asset/Best Express Cargo logo.png',
              // width: 800.w,
              // height: 600.h,
              // scale: 12,
            ),
            SizedBox(height: height / 30),
            Image.asset(
              'asset/quirky-lock-with-password-1-removebg-preview.png',
              // width: 800.w,
              // height: 600.h,
              scale: 1,
            ),
            // kFormField100,
            SizedBox(
              height: height / 30,
            ),
            LoginTextFormForEmailLogin(
                prefixIcon: Icons.email,
                hintText: "Email or Phone",
                controller: _controllerEmail),
            SizedBox(height: height / 80),
            LoginTextForm(
              prefixIcon: Icons.lock,
              hintText: "Password",
              passwordVisiblity: true,
              controller: _controllerPassword,
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
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const BottomNavigationBarScreen(),
                    ),
                  );
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

            TextButton(
                onPressed: () {},
                child: const Text(
                  "Forgot Password..?",
                  style: TextStyle(color: logoBlue),
                )),
          ],
        ),
      ),
    );
  }
}
