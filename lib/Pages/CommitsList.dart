import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_commits_list/Constants/ContantValue.dart';
import 'package:github_commits_list/Constants/SizeConfig.dart';
import 'package:github_commits_list/Model/CommitsData.dart';
import 'package:github_commits_list/Model/SingleCommitData.dart';
import 'package:github_commits_list/Widget/ErrorMessage.dart';
import 'package:github_commits_list/Widget/Loader.dart';
import 'package:github_commits_list/Widget/SingleListDate.dart';
import 'package:github_commits_list/bloc/commit_bloc.dart';

class CommitsList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _CommitsListState();
}

class _CommitsListState extends State<CommitsList> {
  final bloc = new CommitBloc();
  double wratio, hratio;

  @override
  void initState() {
    super.initState();
    bloc.add(getCommits());
    wratio = SizeConfig.widthRatio;
    hratio = SizeConfig.heightRatio;
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(51, 51, 51, 1),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => bloc,
          child: BlocListener(
            bloc: bloc,
            listener: (BuildContext context, state) {},
            child: BlocBuilder(
              bloc: bloc,
              builder: (BuildContext context, state) {
                if (state is CommitInitial || state is CommitLoading) {
                  return Loader();
                } else {
                  if (state is CommitLoaded) {
                    return CommitsList(state.statusCode, state.commitList);
                  } else {
                    return Container();
                  }
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget CommitsList(int statusCode, CommitsData commitList) {
    List<SingleCommitData> comList = commitList.commitsList;
    return statusCode != 200
        ? ErrorMessage()
        : SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      (wratio * 4), (hratio * 2), 0, (hratio * 2)),
                  child: Row(
                    children: [
                      Container(
                        child: Text(
                            "$RepoName".substring(0, 1).toUpperCase() +
                                "$RepoName".substring(1) +
                                " Commit List",
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 2.12 * SizeConfig.heightRatio,
                            )),
                      ),
                      SizedBox(
                        width: wratio * 4,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(81, 80, 80, 1),
                            borderRadius: BorderRadius.circular(50)),
                        padding: EdgeInsets.symmetric(
                            vertical: hratio * 0.7, horizontal: hratio * 1.2),
                        child: Text("master",
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 2.12 * SizeConfig.heightRatio,
                            )),
                      )
                    ],
                  ),
                ),
                ListView.separated(
                    separatorBuilder: (context, index) {
                      return Container(
                        height: 1,
                        decoration:
                            BoxDecoration(color: Color.fromRGBO(64, 64, 64, 1)),
                      );
                    },
                    itemCount: comList.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return SingleListData(
                          comList[index].name,
                          comList[index].title,
                          comList[index].avatar,
                          comList[index].time);
                    })
              ],
            ),
          );
  }
}
