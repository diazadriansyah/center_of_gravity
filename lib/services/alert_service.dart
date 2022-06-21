import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:center_of_gravity/locator.dart';
import 'package:center_of_gravity/services/navigation_service.dart';

class AlertService {
  final NavigationService _navigationService = locator <NavigationService>();

  void showSignOut(BuildContext context, String title, String desc,
      VoidCallback onSignout, VoidCallback onCancel) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(desc),
        actions: <Widget>[
          TextButton(
            child: const Text(
              "YES",
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
            onPressed: onSignout,
          ),
          TextButton(
            child: const Text(
              "NO",
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
            onPressed: onCancel,
          )
        ],
      ));
  }

  void showSuccess(
      BuildContext context, String title, String desc, VoidCallback onCancel) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: Text(title),
          content: Text(desc),
          actions: <Widget>[
            TextButton(
              child: const Text(
                "Done",
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
              onPressed: onCancel,
            ),
          ],
        ));
  }

  void showError(
      BuildContext context, String title, String desc, VoidCallback onCancel) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(desc),
        actions: <Widget>[
          TextButton(
            child: const Text(
              "DONE",
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
            onPressed: onCancel,
          )
        ],
      )
    );
  }

  void showWarning(
      BuildContext context, String title, String desc, VoidCallback onCancel) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(desc),
        actions: <Widget>[
          TextButton(
            child: const Text(
              "DONE",
              style: TextStyle(
                color: Colors.redAccent,
              ),
            ),
            onPressed: onCancel,
          )
        ],
      ));
  }

  void showAlert(BuildContext context, String title, String desc,
      VoidCallback onYes, VoidCallback onCancel) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(desc),
        actions: <Widget>[
          FlatButton(
            child: const Text(
              "YES",
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
            onPressed: onYes,
          ),
          FlatButton(
            child: const Text(
              "NO",
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
            onPressed: onCancel,
          )
        ],
      ));
  }

  void alertDialog(String title, String desc,
      VoidCallback functionCancel, VoidCallback functionDone) {
    showCupertinoDialog(
      context: _navigationService.navigationKey.currentContext!,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title),
        content: Text(desc),
        actions: <Widget>[
          TextButton(
            onPressed: functionCancel,
            child: const Text('Cancel', style: TextStyle(color: Colors.red),),
          ),
          TextButton(
            onPressed: functionDone,
            child: const Text('Done'),
          )
        ],
      )
    );

  }



}