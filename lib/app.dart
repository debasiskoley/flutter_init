import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'config/routes.dart';
import 'utils/colors.dart';
import 'utils/constants.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App>  with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final app = new MaterialApp(
//      color: Color(0xFF1E263B),
        title: cAppName,
        theme: _appTheme,
        debugShowCheckedModeBanner: false,
        home: new SplashScreen(),
        routes: routes
    );
    return app;
  }
}

Future<bool> checkUserAndNavigate(BuildContext context) async {
  var status = true;
  return status;
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  String initialLink;
  AnimationController controller;
  Animation<double> animation;
  bool _isComplete;

  @override
  void initState() {
    super.initState();
    _isComplete = false;
    controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isComplete = true;
        });
      }
    });

  }


  @override
  Widget build(BuildContext context) {
    checkUserAndNavigate(context).then((res) {
      if (_isComplete) {
        print('cdfdf');
        Navigator.pushReplacementNamed(context, '/home');
      }
    });

    return Container(
        color: uColorPrimary,
        child: FadeTransition(
            opacity: animation,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Text('Loading ..', style: TextStyle(fontSize: 20, color: Colors.black))
                ]
            )
        )
    );

  }
}

final ThemeData _appTheme = _buildFlutterTheme();

ThemeData _buildFlutterTheme() {
  final ThemeData base = ThemeData.light();

  return base.copyWith(
    iconTheme: IconThemeData(color: Colors.grey),
    primaryColor: uColorPrimary,
    scaffoldBackgroundColor: uColorPrimary,
    errorColor: uColorErrorRed,
    primaryColorBrightness: Brightness.dark,
    brightness: Brightness.light,
  );
}
