import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:myfirstflutterapp/tab/tabs_page.dart';
import 'package:provider/provider.dart';
import 'package:myfirstflutterapp/providers/app_provider.dart';


import 'package:myfirstflutterapp/pages/statistics_page.dart';
import 'package:myfirstflutterapp/pages/story_page.dart';
import 'package:myfirstflutterapp/util/const.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your appl ication.
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
        builder: (BuildContext context, AppProvider appProvider, Widget child) {
    return MaterialApp(
      key: appProvider.key,
      debugShowCheckedModeBanner: false,
      navigatorKey: appProvider.navigatorKey,
      title: Constants.appName,
      theme: appProvider.theme,
      darkTheme: Constants.darkTheme,
      home: TabsPage(),
        );
      } ,
    );
  }
}