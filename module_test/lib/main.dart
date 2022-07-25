import 'package:flutter/material.dart';
import 'package:module_test/core/permanent_dependencies/permanent_dependencies.dart';
import 'package:module_test/home_page/module/home_module.dart';
import 'package:module_test/login_page/module/login_module.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: PermanentDependencies.init(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/login',
        routes: {
          ...LoginModule().routers,
          ...HomeModule().routers,
        },
      ),
    );
  }
}
