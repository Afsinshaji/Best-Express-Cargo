
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

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
        print("User authenticated");
        AnimatedSnackBar.rectangle("Success", "Authentication Success",
                type: AnimatedSnackBarType.success)
            .show(context);
        Navigator.of(context).pop();
      } else {
        // Authentication failed
        print("Authentication failed");
        AnimatedSnackBar.rectangle("Failed", "Authentication Failed",
                type: AnimatedSnackBarType.error)
            .show(context);
      }
    } else {
      // Biometrics not available
      print("Biometrics not available");
    }
  }
}
