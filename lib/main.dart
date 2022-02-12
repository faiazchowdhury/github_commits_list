import 'package:flutter/material.dart';
import 'package:github_commits_list/Pages/BottomNavBarPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavBarPage(),
    );
  }
}
