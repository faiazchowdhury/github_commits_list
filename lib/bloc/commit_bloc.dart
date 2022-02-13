import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:github_commits_list/Constants/ContantValue.dart';
import 'package:github_commits_list/Model/CommitsData.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'commit_event.dart';
part 'commit_state.dart';

class CommitBloc extends Bloc<CommitEvent, CommitState> {
  CommitBloc() : super(CommitInitial()) {
    on<CommitEvent>((event, emit) async {
      if (event is getCommits) {
        emit.call(CommitLoading());
        var response = await http.get(Uri.parse(
            "$BaseURl/repos/$Owner/$RepoName/commits?per_page=$PerPage&page=$Page"));
        CommitsData commitList =
            CommitsData.fromgJson(json.decode(response.body));
        print("Sasdasd");
        emit.call(CommitLoaded(response.statusCode, commitList));
      }
    });
  }
}
