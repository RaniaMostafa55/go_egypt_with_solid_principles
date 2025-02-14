part of 'profile_bloc.dart';

sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}
final class ProfileLoading extends ProfileState {}
final class ProfileLoaded extends ProfileState {
  final UserProfile profile;

  ProfileLoaded(this.profile);
}
final class ProfileUpdated extends ProfileState {
  final UserProfile profile;

  ProfileUpdated(this.profile);
}
final class ProfileError extends ProfileState {
  final String message;

   ProfileError(this.message);
}