import '../../domain/entities/profile_entity.dart';
import '../../domain/repositories/profile_repository.dart';
import '../data_source/profile_remote_data_source.dart';
// import '../data_source/profile_remote_data_source_impl.dart';
import '../models/profile_model.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepositoryImpl({required this.remoteDataSource});

  @override
  Future<ProfileEntity> getProfile() async {
    final profileModel = await remoteDataSource.getProfile();
    return profileModel.toEntity();
  }

  @override
  Future<void> updateProfile(ProfileEntity profile) async {
    final profileModel = ProfileModel(
      id: profile.id,
      name: profile.name,
      email: profile.email,
      phone: profile.phone,
      password: profile.password,
      imagePath: profile.imagePath,
    );
    await remoteDataSource.updateProfile(profileModel);
  }

  @override
  Future<void> updateProfileImage(String imagePath) async {
    await remoteDataSource.updateProfileImage(imagePath);
  }
}
