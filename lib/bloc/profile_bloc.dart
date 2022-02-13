import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:github_commits_list/Constants/ContantValue.dart';
import 'package:github_commits_list/Model/ProfileData.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) async {
      if (event is getProfileInfo) {
        emit(ProfileLoading());
        var response =
            await http.get(Uri.parse("$BaseURl/users/$profileOwner"));
        ProfileData temp = ProfileData.fromJson(json.decode(response.body));
        emit(ProfileLoaded(response.statusCode, temp));
      }
    });
  }
}
