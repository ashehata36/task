import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:task1/utilities/bindings/initial_bindings.dart';
import 'package:task1/utilities/resources/theme_manager.dart';
import 'package:task1/utilities/router.dart';
import 'package:task1/utilities/routes.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: getApplicationTheme(),
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBindings(),
      locale: const Locale('en'),
      fallbackLocale: const Locale('en'),
      textDirection:TextDirection.ltr,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      onGenerateRoute: onGenerate,
      initialRoute: AppRoutes.bottomBarPageRoute,
    );
  }
}