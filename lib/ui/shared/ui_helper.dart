import 'package:flutter/material.dart';

const Widget horizontalSpaceTiny = SizedBox(width: 5.0);
const Widget horizontalSpaceSmall = SizedBox(width: 10.0);
const Widget horizontalSpaceMedium = SizedBox(width: 25.0);

const Widget verticalSpaceTiny = SizedBox(height: 5.0);
const Widget verticalSpaceSmall = SizedBox(height: 10.0);
const Widget verticalSpaceMedium = SizedBox(height: 20.0);
const Widget verticalSpaceLarge = SizedBox(height: 50.0);
const Widget verticalSpaceMassive = SizedBox(height: 120.0);

Widget spacedDivider = Column(
  children: const <Widget>[
    verticalSpaceMedium,
    const Divider(color: Colors.blueGrey, height: 5.0),
    verticalSpaceMedium,
  ],
);

Widget verticalSpace(double height) => SizedBox(height: height);

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double screenHeightFraction(BuildContext context,
    {int divideBy = 1, double offsetBy = 0}) =>
    (screenHeight(context) - offsetBy) / divideBy;

double screenWidthFraction(BuildContext context,
    {int divideBy = 1, double offsetBy = 0}) =>
    (screenWidth(context) - offsetBy) / divideBy;

double halfScreenWidth(BuildContext context) =>
    screenWidthFraction(context, divideBy: 2);

double thirdScreenWidth(BuildContext context) =>
    screenWidthFraction(context, divideBy: 3);

double screenWidthPercent(BuildContext context, {double multipleBy = 1}) =>
    (screenWidth(context) * multipleBy);

double screenHeightPercent(BuildContext context, {double multipleBy = 1}) =>
    (screenHeight(context) * multipleBy);
