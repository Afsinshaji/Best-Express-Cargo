import 'package:best_seller/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

signOutDilogueBox(context) {
  Alert(
    context: context,
    type: AlertType.info,
    title: "Signout",
    desc: "Are you sure?.",
    buttons: [
      DialogButton(
        onPressed: () => Navigator.pop(context),
        // color: const Color.fromRGBO(0, 179, 134, 1.0),
        gradient: const RadialGradient(radius: 2, colors: [       
          Color.fromARGB(255, 0, 253, 34),
          Color.fromARGB(255, 43, 119, 53),
        ]),
        child: const Text(
          "Cancel",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      
      DialogButton(
        onPressed: () {
          Provider.of<AuthStateManagement>(context, listen: false)
              .performLogout(context);

          Navigator.of(context).pop();
        },
        gradient: const RadialGradient(radius: 2, colors: [
          Color.fromARGB(255, 255, 11, 11),
          Color.fromARGB(255, 119, 43, 43),
        ]),
        //  LinearGradient(colors: [
        //   Color.fromARGB(255, 170, 70, 70),
        //   Color.fromARGB(255, 250, 50, 50),
        // ]),
        child: const Text(
          "Signout",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      )
    ],
  ).show();
}
