import 'package:flutter/material.dart';
import 'package:github_commits_list/Constants/SizeConfig.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            backgroundColor: Color.fromRGBO(10, 132, 255, 1),
          ),
          SizedBox(
            height: SizeConfig.heightRatio * 2,
          ),
          Text(
            "Loading...",
            style: TextStyle(
              color: Color.fromRGBO(10, 132, 255, 1),
              fontSize: SizeConfig.heightRatio * 2.1,
              fontFamily: "SourceSans",
            ),
          )
        ],
      ),
    );
  }
}
