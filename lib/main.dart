import 'package:flutter/material.dart';
import 'package:github_commits_list/Constants/SizeConfig.dart';
import 'package:github_commits_list/Pages/BottomNavBarPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      SizeConfig(constraints.maxHeight, constraints.maxWidth);
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottomNavBarPage(),
      );
    });
  }
}
