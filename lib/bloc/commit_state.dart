part of 'commit_bloc.dart';

@immutable
abstract class CommitState {}

class CommitInitial extends CommitState {}

class CommitLoading extends CommitState {}

class CommitLoaded extends CommitState {
  final int statusCode;
  final CommitsData commitList;
  CommitLoaded(this.statusCode, this.commitList);
}
