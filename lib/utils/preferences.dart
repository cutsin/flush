import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences _preferences;
Future preferences() async {
  _preferences ??= await SharedPreferences.getInstance();
  return _preferences;
}
