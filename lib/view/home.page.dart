import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

import 'package:sms_portal/components/zoom_scaffold.dart';
import 'package:sms_portal/config/menu_page.dart';
import 'package:sms_portal/utils/colors.dart';

import 'dashboard.page.dart';
import 'reports.page.dart';
import 'about.page.dart';

class HomePage extends StatefulWidget {

  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  DateTime currentBackPressTime = DateTime.now();
  MenuController menuController;
  String currentRoute;

  @override
  void initState() {
    super.initState();

    menuController = new MenuController(
      vsync: this,
    )..addListener(() => setState(() {}));
  }

  _getCurrentRoute(route) {
    setState(() {
      currentRoute = route;
      print(currentRoute);
    });
  }

  @override
  void dispose() {
    menuController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final platform = Theme.of(context).platform;
    return Scaffold(
      backgroundColor: uColorSecondary,
//      appBar: ApplicationBar(title: widget.title),
      body: WillPopScope(
        child: Stack(
          children: <Widget>[
//              _buildBack(),
            GestureDetector(
              child:ChangeNotifierProvider(
              builder: (context) => menuController,
                child: ZoomScaffold(
                  menuScreen: MenuScreen(routerCallback: _getCurrentRoute),
                  contentScreen: Layout(
                    contentBuilder: (cc) => Container(
                      color: Colors.white,
                      child: Container(
                        color: Colors.white,
                        child: _showBody(platform),
                      ),
                    ),
                  ),
                ),
              ),
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

  Widget _showBody(platform){
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Expanded(
                child: _buildTabView(currentRoute, platform)
            )
          ],
        ),
      ],
    );// This trailing comma makes auto-formatting nicer for build methods.
  }


  Widget _buildTabView(route, platform) {
    switch (route) {
      case 'dashboard':
        return DashboardPage();
        break;
      case 'reports':
        return ReportPage();
        break;
      case 'about':
        return AboutPage();
        break;
      default:
        return DashboardPage();
    }
  }

}