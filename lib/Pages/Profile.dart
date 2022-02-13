import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_commits_list/Constants/SizeConfig.dart';
import 'package:github_commits_list/Model/ProfileData.dart';
import 'package:github_commits_list/Widget/ErrorMessage.dart';
import 'package:github_commits_list/Widget/Loader.dart';
import 'package:github_commits_list/bloc/profile_bloc.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _ProfileState();
}

class _ProfileState extends State<Profile> {
  final bloc = new ProfileBloc();
  double wratio, hratio;

  @override
  void initState() {
    super.initState();
    bloc.add(getProfileInfo());
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
    return SafeArea(
      child: BlocBuilder(
        bloc: bloc,
        builder: (BuildContext context, state) {
          if (state is ProfileInitial || state is ProfileLoading) {
            return Loader();
          } else if (state is ProfileLoaded) {
            return ProfileInfo(state.statusCode, state.data);
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget ProfileInfo(int statusCode, ProfileData data) {
    return statusCode != 200
        ? ErrorMessage()
        : Container(
            padding: EdgeInsets.fromLTRB(wratio * 16, hratio * 7, 0, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      data.avatar,
                      height: 22 * hratio,
                      width: 22 * hratio,
                    ),
                  ),
                  SizedBox(
                    height: hratio * 3,
                  ),
                  Text(
                    data.name,
                    style: TextStyle(
                        fontFamily: "SourceSans",
                        color: Colors.white,
                        fontSize: hratio * 3,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: hratio * 1,
                  ),
                  Text(
                    "@" + data.userName,
                    style: TextStyle(
                        fontFamily: "SourceSans",
                        color: Color.fromRGBO(201, 201, 201, 201),
                        fontSize: hratio * 1.8,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: hratio * 3,
                  ),
                  SizedBox(
                    width: wratio * 50,
                    child: Text("Bio: " + data.bio,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontFamily: "SourceSans",
                            color: Colors.white,
                            fontSize: hratio * 2.12,
                            fontWeight: FontWeight.w400)),
                  ),
                  SizedBox(
                    height: hratio * 3,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Public Repos: " + data.publicRepo,
                            style: TextStyle(
                                fontFamily: "SourceSans",
                                color: Colors.white,
                                fontSize: hratio * 2.12,
                                fontWeight: FontWeight.w400)),
                        SizedBox(
                          height: hratio * 1,
                        ),
                        Text("Public Gists: " + data.publicGist,
                            style: TextStyle(
                                fontFamily: "SourceSans",
                                color: Colors.white,
                                fontSize: hratio * 2.12,
                                fontWeight: FontWeight.w400)),
                        SizedBox(
                          height: hratio * 1,
                        ),
                        Text("Private Repos: " + data.privateRepo,
                            style: TextStyle(
                                fontFamily: "SourceSans",
                                color: Colors.white,
                                fontSize: hratio * 2.12,
                                fontWeight: FontWeight.w400)),
                      ]),
                ],
              ),
            ));
  }
}
