import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:center_of_gravity/ui/shared/ui_helper.dart';
import 'package:center_of_gravity/viewmodels/startup_view_model.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:stacked/stacked.dart';

class StartUpView extends StatelessWidget {
  const StartUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return ViewModelBuilder<StartUpViewModel>.reactive(
      viewModelBuilder: () => StartUpViewModel(),
      onModelReady: (model) {
        model.startTimer();
      },
      builder: (context, model, child) => Scaffold(
        backgroundColor: HexColor("4186B2"),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              verticalSpaceMedium,
              Image.asset('assets/cogkit.png',width: 350, height: 150),
              verticalSpaceMedium,
              Text(
                'Center of Gravity',
                style: TextStyle(fontSize: 30, color: HexColor('FDC619')),
              ),
              verticalSpaceMedium,
              CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation(
                  HexColor('FDC619'),
                ),
              ),
              verticalSpaceMedium,
            ],
          ),
        ),
      ),
    );
  }
}