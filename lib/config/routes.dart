import 'package:sms_portal/utils/constants.dart';
import 'package:sms_portal/view/home.page.dart';
import 'package:sms_portal/view/login.page.dart';


final routes = {
  '/login': (context) => LoginPage(title: cAppName),
  '/home': (context) => HomePage(title: cAppName),
};
