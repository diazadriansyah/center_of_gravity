import 'package:get_it/get_it.dart';
import 'package:center_of_gravity/services/alert_service.dart';
import 'package:center_of_gravity/services/navigation_service.dart';
import 'package:center_of_gravity/services/rmq_service.dart';
import 'package:center_of_gravity/services/storage_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AlertService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => RmqService());
  locator.registerLazySingleton(() => StorageService());
}