import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:github_commits_list/Constants/SizeConfig.dart';
import 'package:github_commits_list/Pages/CommitsList.dart';
import 'package:github_commits_list/Pages/Profile.dart';

class BottomNavBarPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  int currentIndex = 0;
  List<Widget> pages = [CommitsList(), Profile()];

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(51, 51, 51, 1),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(22, 22, 22, 0.94),
        unselectedItemColor: Color.fromRGBO(10, 132, 255, 0.5),
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
              title: Text(
                "Commits",
                style: TextStyle(
                    fontFamily: "SourceSans",
                    fontSize: SizeConfig.heightRatio * 1.25),
              ),
              icon: SvgPicture.asset("assets/git-commit.svg",
                  color: currentIndex == 0
                      ? Color.fromRGBO(10, 132, 255, 1)
                      : Color.fromRGBO(10, 132, 255, 0.5))),
          BottomNavigationBarItem(
            title: Text("User Profile",
                style: TextStyle(
                    fontFamily: "SourceSans",
                    fontSize: SizeConfig.heightRatio * 1.25)),
            icon: SvgPicture.asset("assets/user.svg",
                color: currentIndex == 1
                    ? Color.fromRGBO(10, 132, 255, 1)
                    : Color.fromRGBO(10, 132, 255, 0.5)),
          ),
        ],
      ),
      body: currentIndex == 0 ? CommitsList() : Profile(),
    );
  }
}
