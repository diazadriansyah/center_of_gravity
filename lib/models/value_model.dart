class ValueModel{
  String _serial;
  String _nama;
  String _value;
  String _date;
  String _time;


  ValueModel(this._serial, this._nama, this._value, this._date, this._time);

  String get serial => _serial;

  set serial(String value) {
    _serial = value;
  }

  String get nama => _nama;

  String get value => _value;

  set value(String value) {
    _value = value;
  }

  set nama(String value) {
    _nama = value;
  }

  String get date => _date;

  set date(String value) {
    _date = value;
  }

  String get time => _time;

  set time(String value) {
    _time = value;
  }

}