import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'utils/colors.dart';
import 'app.dart';


void main() {

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: uColorPrimary, // Color for Android
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark // Dark == white status bar -- for IOS.
  ));

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new App());
  });

}