import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_egypt_with_firebase/core/blocs/profile/profile_bloc.dart';
import 'package:go_egypt_with_firebase/features/profile/widgets/image_option.dart';

class ProfilePicFrame extends StatelessWidget {
  const ProfilePicFrame({super.key, required this.img});

  final String img;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 140,
          height: 140,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: context.watch<ProfileBloc>().isProfileImgDeleted!
                  ? AssetImage(img)
                  : FileImage(context.watch<ProfileBloc>().profileImg!),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 1,
                blurRadius: 10,
                offset: Offset(0, 3),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.primary,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.edit,
                color: Colors.white,
                size: 18,
              ),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(16)),
                    ),
                    builder: (context) {
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20))),
                            height: MediaQuery.of(context).size.height * 0.18,
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical:
                                    MediaQuery.of(context).size.height * 0.013),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ImageOption(
                                    icon: Icons.photo_camera,
                                    onPressed: () {
                                      context
                                          .read<ProfileBloc>()
                                          .isProfileImgDeleted = false;
                                      context
                                          .read<ProfileBloc>()
                                          .changeImgWithCam = true;
                                      context
                                          .read<ProfileBloc>()
                                          .add(UpdateAvatar());
                                      Navigator.pop(context);
                                    },
                                    title: "Camera"),
                                ImageOption(
                                    icon: Icons.image,
                                    onPressed: () {
                                      context
                                          .read<ProfileBloc>()
                                          .isProfileImgDeleted = false;
                                      context
                                          .read<ProfileBloc>()
                                          .changeImgWithCam = false;
                                      context
                                          .read<ProfileBloc>()
                                          .add(UpdateAvatar());
                                      Navigator.pop(context);
                                    },
                                    title: "Gallery"),
                                ImageOption(
                                    icon: Icons.delete,
                                    onPressed: () {
                                      context
                                          .read<ProfileBloc>()
                                          .isProfileImgDeleted = true;
                                      context
                                          .read<ProfileBloc>()
                                          .changeImgWithCam = false;
                                      context
                                          .read<ProfileBloc>()
                                          .add(UpdateAvatar());
                                      Navigator.pop(context);
                                    },
                                    title: "Delete Image")
                              ],
                            )),
                      );
                    });
              },
            ),
          ),
        ),
      ],
    );
  }
}
