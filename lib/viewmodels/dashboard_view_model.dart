import 'package:center_of_gravity/models/value_model.dart';
import 'package:flutter/material.dart';
import 'package:center_of_gravity/constants/const.dart';
import 'package:center_of_gravity/constants/route_name.dart';
import 'package:center_of_gravity/locator.dart';
import 'package:center_of_gravity/services/navigation_service.dart';
import 'package:center_of_gravity/services/alert_service.dart';
import 'package:center_of_gravity/services/rmq_service.dart';
import 'package:center_of_gravity/services/storage_service.dart';
import 'package:center_of_gravity/viewmodels/base_model.dart';
import 'package:intl/intl.dart';

class DashboardViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final AlertService _alertService = locator<AlertService>();
  final RmqService _rmqService = locator<RmqService>();
  final StorageService _storageService = locator<StorageService>();

  TextEditingController guidController = TextEditingController();
  TextEditingController valueController = TextEditingController();

  List<ValueModel> device = [];
  String datetime = '';
  String time = '';


  void initState() async {
    setBusy(true);
    subscribeDataTimbangan();
    setBusy(false);
  }

  void checkDataQr() async {
    _navigationService.navigateTo(qrViewRoute);
  }

  void subscribeDataTimbangan() async {
    final host = await _storageService.getString(localDataHost);
    final user = await _storageService.getString(localDataUser);
    final pass = await _storageService.getString(localDataPass);
    final vHost = await _storageService.getString(localDataVhost);
    _rmqService.subscribe(
      sensorTimbangan,
      host!.toString(),
      user!.toString(),
      pass!.toString(),
      vHost!.toString()
    );
  }

  void sensorTimbangan() async {
    final queues = await _storageService.getString(localDataQSensor);
    _rmqService.dataDevice(
        queues.toString(),
        setValueSensor
    );
    print('[Data Timbangan] $queues');
  }

  void setValueSensor(String message) async {
    date();
    times();
    List<String> list = message.split('#');
    final guid = await _storageService.getString(localDataGuid);
    setBusy(true);
    var user = list[0];
    var value = list[1];
      device.add(ValueModel(user, "TIMBANGAN", value, datetime, time));
    setBusy(false);
  }

  void movePage(String routeName) {
    _navigationService.navigateTo(routeName);
  }

  void resetData() async {
    _alertService.alertDialog("Warning", "Delete Data ?", () {_navigationService.pop();}, () async { await _storageService.clearStorage();
    _navigationService.navigateTo(loginViewRoute);
    print('[Delete Device] Succes');});
    print('[Alert Delete]');
  }

  void date(){
    var now = new DateTime.now();
    var formatter = new DateFormat('dd MMMM yyyy');
    String formattedDate = formatter.format(now);
    datetime = formattedDate;
    print(DateFormat().format(now));
    print("format data"+formattedDate);
    print("date "+ now.day.toString());
  }

  void times(){
    final String formattedDateTime =
    DateFormat('kk:mm:ss').format(DateTime.now()).toString();
    setBusy(true);
    time = formattedDateTime;
    setBusy(false);
  }



}