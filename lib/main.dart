import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

void main() {
  runApp(TentwentyFlutterApp());
}
class TentwentyFlutterApp extends StatefulWidget {
  TentwentyFlutterApp() {
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  _TentwentyFlutterAppState createState() => _TentwentyFlutterAppState();
}

class _TentwentyFlutterAppState extends State<TentwentyFlutterApp>{
  @override
  Widget build(BuildContext buildContext) {
    return MaterialApp(
          supportedLocales: [
            Locale('en'),
          ],
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primarySwatch: Colors.green, primaryColor: Colors.green),
          onGenerateRoute: Application.router.generator,
          navigatorKey: GlobalKey<NavigatorState>(),

        );
  }
}
