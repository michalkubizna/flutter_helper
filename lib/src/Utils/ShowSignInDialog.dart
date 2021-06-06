import 'package:flutter_helper/flutter_helper.dart';
import 'package:flutter/material.dart';

Future showSignInDialogView(BuildContext context, Widget screen) async {
  await showDialogView(
      context,
      builder: (context) => AlertDialog(
        title: Text("Sign in required"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Please sign in or create a free account to continue.'),
          ],
        ),
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("CANCEL"),
          ),
          FlatButton(
            onPressed: () async {
              Navigator.pop(context);

              await pushView(context, screen);
            },
            child: Text("SIGN IN"),
          )
        ],
      )
  );
}