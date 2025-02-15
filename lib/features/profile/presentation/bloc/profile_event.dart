part of 'profile_bloc.dart';

abstract class ProfileEvent {}

class LoadProfile extends ProfileEvent {}
class UpdateProfile extends ProfileEvent {
  final SignUpModel profileData;

   UpdateProfile({required this.profileData});
}
class UpdateAvatar extends ProfileEvent {}

