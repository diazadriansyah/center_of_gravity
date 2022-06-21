import 'dart:async';

import 'package:center_of_gravity/constants/const.dart';
import 'package:center_of_gravity/constants/route_name.dart';
import 'package:center_of_gravity/locator.dart';
import 'package:center_of_gravity/services/navigation_service.dart';
import 'package:center_of_gravity/services/storage_service.dart';
import 'package:center_of_gravity/services/storage_service.dart';
import 'package:center_of_gravity/viewmodels/base_model.dart';

class StartUpViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final StorageService _storageService = locator<StorageService>();

  startTimer() async {
    var _duration = Duration(seconds: 5);
    return Timer(_duration, handleStartUpLogic);
  }

  Future handleStartUpLogic() async {
    final user = await _storageService.getString(localDataUser);
    print('User $user');
    if (user == null) {
      _navigationService.replaceTo(loginViewRoute);
    } else {
      _navigationService.replaceTo(dashboardViewRoute);
    }
  }
}