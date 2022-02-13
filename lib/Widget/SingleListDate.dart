import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_commits_list/Constants/SizeConfig.dart';
import 'package:intl/intl.dart';

class SingleListData extends StatefulWidget {
  final String title, name, avatar, time;
  SingleListData(this.name, this.title, this.avatar, this.time);
  @override
  State<StatefulWidget> createState() =>
      new _SingleListDataState(name, title, avatar, time);
}

class _SingleListDataState extends State<SingleListData> {
  String name, title, avatar, time;

  DateTime tempYesterday = DateTime.now().subtract(Duration(days: 1));
  _SingleListDataState(this.name, this.title, this.avatar, time) {
    DateTime tempTime = DateTime.parse(time).toLocal();

    if (tempTime.day == DateTime.now().day &&
        tempTime.month == DateTime.now().month &&
        tempTime.year == DateTime.now().year) {
      this.time = DateFormat().add_Hm().format(tempTime);
      print(time);
    } else if (tempTime.day == tempYesterday.day &&
        tempTime.month == tempYesterday.month &&
        tempTime.year == tempYesterday.year) {
      this.time = "Yesterday";
    } else if (tempTime.isAfter(DateTime.now().subtract(Duration(days: 5)))) {
      this.time = DateFormat().add_EEEE().format(tempTime);
    } else {
      this.time = DateFormat('M/d/yy').format(tempTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    double hratio = SizeConfig.heightRatio;
    double wratio = SizeConfig.widthRatio;
    return Container(
        padding: EdgeInsets.fromLTRB(
            wratio * 5.5, hratio * 2, wratio * 5.5, hratio * 2),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: wratio * 60,
                  child: Text(
                    title,
                    maxLines: 3,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "SourceSans",
                        fontSize: hratio * 2.12,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Text(
                  time ?? "",
                  style: TextStyle(
                      color: Color.fromRGBO(184, 184, 184, 1),
                      fontFamily: "SourceCode",
                      fontSize: hratio * 1.5,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            SizedBox(
              height: hratio * 1.5,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    avatar,
                    height: hratio * 2.8,
                    width: hratio * 2.8,
                  ),
                ),
                SizedBox(
                  width: wratio * 3,
                ),
                Text(
                  name,
                  style: TextStyle(
                      color: Color.fromRGBO(155, 155, 155, 1),
                      fontFamily: "SourceCode",
                      fontSize: hratio * 1.5,
                      fontWeight: FontWeight.w400),
                ),
              ],
            )
          ],
        ));
  }
}
