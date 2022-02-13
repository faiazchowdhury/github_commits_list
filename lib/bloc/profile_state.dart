part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final int statusCode;
  final ProfileData data;

  ProfileLoaded(this.statusCode, this.data);
}
