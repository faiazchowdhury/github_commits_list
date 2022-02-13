import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_commits_list/Constants/SizeConfig.dart';

class ErrorMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(SizeConfig.widthRatio * 9),
      child: Text("Sorry, something went wrong please try again later!",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontFamily: "SourceSans",
              fontSize: SizeConfig.heightRatio * 2.12,
              fontWeight: FontWeight.w400)),
    );
  }
}
