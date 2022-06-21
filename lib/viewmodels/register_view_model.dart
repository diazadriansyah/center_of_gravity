import 'package:flutter/cupertino.dart';
import 'package:center_of_gravity/constants/const.dart';
import 'package:center_of_gravity/constants/route_name.dart';
import 'package:center_of_gravity/locator.dart';
import 'package:center_of_gravity/models/model_data_device.dart';
import 'package:center_of_gravity/services/alert_service.dart';
import 'package:center_of_gravity/services/navigation_service.dart';
import 'package:center_of_gravity/services/storage_service.dart';
import 'package:center_of_gravity/viewmodels/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;

class RegisterViewModel extends BaseModel {
  TextEditingController guidController = TextEditingController();
  TextEditingController nameSensorController = TextEditingController();
  TextEditingController nameAktuatorController = TextEditingController();
  TextEditingController namePowerController = TextEditingController();

  final NavigationService _navigationService = locator<NavigationService>();
  final AlertService _alertService = locator<AlertService>();
  final StorageService _storageService = locator<StorageService>();

  Future<void> getTask() async {
    showData();
  }

  void showData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? data = sharedPreferences.getString('datadevice');

    var result = convert.jsonDecode(data!);
    var guid = result['guid'];
    guidController.text = guid;
  }

  void registerDevice(BuildContext context) async {
    if(guidController.text.isNotEmpty){
      String guid = guidController.text;
      await _storageService.setString(localDataGuid, guid);

      _alertService.showWarning(context,
        'Success',
        'Device Added',
          (){movePage(dashboardViewRoute);}
      );
      } else {
        print('print update');
        _alertService.showWarning(context,
          'Warning',
          'Please Fill All Field',
          _navigationService.pop
        );
    }
  }

  void checkDataQr(BuildContext context) async {
    final guid = await _storageService.getString(localDataGuid);
    if(guid!.isNotEmpty){
      _alertService.showWarning(context,
        'Warning',
        'You Already Registered Device',
          () {_navigationService.pop();
          });
    } else {
      _navigationService.navigateTo(qrViewRoute);
    }
  }

  void movePage(String routeName) {
    _navigationService.navigateTo(routeName);
  }
}