import '../repositories/profile_repository.dart';

class UpdateProfileImageUseCase {
  final ProfileRepository repository;

  UpdateProfileImageUseCase(this.repository);

  Future<void> call(String imagePath) async {
    return await repository.updateProfileImage(imagePath);
  }
}
