import 'package:center_of_gravity/models/value_model.dart';
import 'package:center_of_gravity/ui/shared/ui_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContentCardView extends StatelessWidget{
  ValueModel device;
  ContentCardView({required this.device});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: double.maxFinite,
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(7),
          child: Stack(children: <Widget>[
            Align(
              alignment: Alignment.centerRight,
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Image.asset('assets/cogkit.png',width: 50,height: 50),
                            SizedBox(width: 20),
                            Column(
                              children: [
                                Text('${device.nama}',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20)),
                                SizedBox(height: 5),
                                Container(
                                  width: 150,
                                  child: Text('${device.serial}',style: TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                                )
                              ],
                            ),
                            horizontalSpaceSmall,
                            Column(
                              children: [
                                Text('${device.date}', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 10)),
                                Text('${device.time}', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 10))
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 25),
                        Row(
                          children: <Widget>[
                            RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                text: '${device.value}',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'gram',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],),
        ),
      ),
    );
  }
}