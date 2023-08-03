import 'dart:developer';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class LocalAuth {
  final LocalAuthentication auth = LocalAuthentication();

  Future<void> authenticate(context) async {
    bool canAuthenticate = false;
    try {
      canAuthenticate = await auth.canCheckBiometrics;
    } catch (e) {
      print(e);
    }

    if (canAuthenticate) {
      bool isAuthenticated = false;

      try {
        isAuthenticated = await auth.authenticate(
          localizedReason: "Scan Your Finger to Authenticate",
          options: const AuthenticationOptions(
            useErrorDialogs: true,
            stickyAuth: true,
          ),
        );
      } catch (e) {
        print(e);
      }
      if (isAuthenticated) {
        // User is authenticated
        log("User authenticated");
        final snackBar = SnackBar(
          padding: const EdgeInsets.all(30),
          duration: const Duration(seconds: 3),
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            inMaterialBanner: true,
            title: "Successfully",
            message: "Finger print authentication successfully done",
            contentType: ContentType.success,
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.of(context).pop();
      } else {
        // Authentication failed
        log("Authentication failed");
        final snackBar = SnackBar(
          padding: const EdgeInsets.all(30),
          duration: const Duration(seconds: 3),
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            inMaterialBanner: true,
            title: "Authentication failed",
            message: "Finger print authentication failed",
            contentType: ContentType.failure,
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } else {
      // Biometrics not available
      print("Biometrics not available");
    }
  }
}
