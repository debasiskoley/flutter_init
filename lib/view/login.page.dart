import 'package:flutter/material.dart';
import 'package:sms_portal/utils/colors.dart';
import 'package:sms_portal/utils/constants.dart';
import 'package:toast/toast.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final focus = FocusNode();
  DateTime currentBackPressTime = DateTime.now();

  @override
  void initState() {
    super.initState();
  }


  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
//    _isIos = Theme.of(context).platform == TargetPlatform.iOS;
    return  Scaffold(
      body: WillPopScope(
        child: new Stack(
          children: <Widget>[
            GestureDetector(
              child: _showBody(),
              onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
            ),
          ],
        ),
        onWillPop: onWillPop,
      ),
    );
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Toast.show('Press again to exit app.', context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      return Future.value(false);
    }
    return Future.value(true);
  }


  Widget _showBody(){
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.fromLTRB(42.0, 47.0, 42.0, 42.0),
      child: _showAppTitle(),
    );
  }

  Widget _showAppTitle(){
    return Container(
      padding: EdgeInsets.only(top: 43),
      child: Text(
          "Welcome to $cAppName",
          textAlign: TextAlign.left,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: uColorPrimary,
          )
      ),
    );
  }

}