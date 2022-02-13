import 'package:github_commits_list/Model/SingleCommitData.dart';

class CommitsData {
  List<SingleCommitData> commitsList;

  CommitsData({this.commitsList});

  factory CommitsData.fromgJson(List<dynamic> json) => CommitsData(
      commitsList: json == null
          ? null
          : List<SingleCommitData>.from(
              json.map((x) => SingleCommitData.fromJson(x))));
}
