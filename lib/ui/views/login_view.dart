import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:center_of_gravity/ui/shared/ui_helper.dart';
import 'package:center_of_gravity/ui/views/dashboard_view.dart';
import 'package:center_of_gravity/viewmodels/login_view_model.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:stacked/stacked.dart';

import 'dashboard_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _obscureText = true;

  String _password = "";

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      onModelReady: (model) => model.getTask(),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          backgroundColor: HexColor("4186b2"),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.all(30),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: Column(
                  children: <Widget>[
                    const Text(
                      "LOGIN CREDENTIAL",
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    verticalSpaceMedium,
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "User",
                        border: OutlineInputBorder(),
                        hintText: "ex: smkn13bandung"
                      ),
                      controller: model.userController,
                      keyboardType: TextInputType.text,
                    ),
                    verticalSpaceMedium,
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(),
                        hintText: "ex: qwerty",
                        suffixIcon: IconButton(
                          onPressed: _toggle,
                          icon: Icon(
                            _obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined, color: Colors.grey,
                          ),
                        )
                      ),
                      controller: model.passController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: _obscureText,
                    ),
                    verticalSpaceMedium,
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Host",
                        border: OutlineInputBorder(),
                        hintText: "ex: cloud.rmq.pptik.id"
                      ),
                      controller: model.hostController,
                      keyboardType: TextInputType.text,
                    ),
                    verticalSpaceMedium,
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Virtual Host",
                        border: OutlineInputBorder(),
                        hintText: "ex: /smkn13bandung"
                      ),
                      controller: model.vhostController,
                      keyboardType: TextInputType.text,
                    ),
                    verticalSpaceMedium,
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Queues Sensor",
                        border: OutlineInputBorder(),
                        hintText: "ex: smkn2_diaz"
                      ),
                      controller: model.queuesSensorController,
                      keyboardType: TextInputType.text,
                    ),
                    verticalSpaceMedium,
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Guid KIT',
                        border: OutlineInputBorder(),
                      ),
                      controller: model.guidController,
                      keyboardType: TextInputType.text,
                    ),
                    verticalSpaceMedium,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton(
                          child: Container(
                            padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                            decoration: BoxDecoration(
                              color: HexColor('FDC619'),
                              borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            child: const Text("LOGIN", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),),
                          ),
                          onPressed: () {
                            model.loginAccount(context);
                          },
                        ),
                        IconButton(
                          onPressed: () {
                            model.checkDataQr();
                          },
                          icon: Icon(Icons.qr_code_scanner, color: HexColor('FDC619'), size: 30,)
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}