import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hexon_flutter_web/routes/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      title: 'Hexon',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Alibaba',
        platform: TargetPlatform.android, //NOTE: 用来禁用滑动返回的。
      ),
      initialRoute: AppRoute.initialRoute,
      routes: AppRoute.sharedInstance().routes,
      onGenerateRoute: AppRoute.sharedInstance().generatedRoutes,
    );
  }
}
