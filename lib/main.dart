import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:center_of_gravity/locator.dart';
import 'package:center_of_gravity/services/alert_service.dart';
import 'package:center_of_gravity/services/navigation_service.dart';
import 'package:center_of_gravity/ui/router.dart';
import 'package:center_of_gravity/ui/views/login_view.dart';
import 'package:center_of_gravity/ui/views/dashboard_view.dart';
import 'package:center_of_gravity/ui/views/register_view.dart';
import 'package:center_of_gravity/ui/views/startup_view.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      theme: ThemeData.light(),
      title: 'Center of Gravity Trainer',
      home: StartUpView(),
      debugShowCheckedModeBanner: false,
      navigatorKey: locator<NavigationService>().navigationKey,
      onGenerateRoute: generateRoute,
    );
  }
}