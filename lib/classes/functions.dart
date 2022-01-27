import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

late Size screenSize;
double doubleHeight(double value, {double height: 0}) {
  if (height == 0) height = screenSize.height;
  return (height * value) / 100;
}

double doubleWidth(double value, {double width: 0}) {
  if (width == 0) width = screenSize.width;
  return (width * value) / 100;
}

statusSet({Color? statusBar,bool? statusBarIconIsWhite,Color? navigationBar,bool? navigationBarLineIsWhite}) async {
  try {
      WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: statusBar,
    statusBarBrightness: (statusBarIconIsWhite!=null)?(statusBarIconIsWhite?Brightness.light:Brightness.dark):null,
    statusBarIconBrightness: (statusBarIconIsWhite!=null)?(statusBarIconIsWhite?Brightness.light:Brightness.dark):null,
    systemNavigationBarColor: navigationBar,
    systemNavigationBarIconBrightness: (navigationBarLineIsWhite!=null)?(navigationBarLineIsWhite?Brightness.light:Brightness.dark):null,
  ));
  } on PlatformException catch (e) {
    debugPrint(e.toString());
  }
}
