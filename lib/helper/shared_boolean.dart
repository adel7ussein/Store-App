import 'package:shared_preferences/shared_preferences.dart';

bool isLastPage = false;

void saveBool() async {
  SharedPreferences sharedPreferenced = await SharedPreferences.getInstance();
  sharedPreferenced.setBool('shared boolean', true);
}

Future<void> getBool() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  isLastPage = await sharedPreferences.getBool('shared boolean') ?? false;
}
