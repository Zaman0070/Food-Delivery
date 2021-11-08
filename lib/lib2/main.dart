// import 'package:socialui/Constance/theme.dart';
// import 'package:socialui/Home/CustomeUi.dart';
// import 'package:socialui/Splash/SplashScreen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]).then((_) => runApp(new MyApp()));
// }
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: AppTheme.getTheme(),
//       debugShowCheckedModeBanner: false,
//       routes: routes,
//     );
//   }
//
//   var routes = <String, WidgetBuilder>{
//     Routes.SPLASH: (BuildContext context) => SplashScreen(),
//     Routes.HOME: (BuildContext context) => CustomeUiScreen(),
//   };
// }
//
// class Routes {
//   static const String SPLASH = "/";
//   static const String HOME = "/Home/CustomeUi";
// }
