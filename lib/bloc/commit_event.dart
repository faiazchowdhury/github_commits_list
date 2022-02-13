part of 'commit_bloc.dart';

@immutable
abstract class CommitEvent {}

class getCommits extends CommitEvent {}
