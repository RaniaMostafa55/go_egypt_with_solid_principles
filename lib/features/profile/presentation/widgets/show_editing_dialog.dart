import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_egypt_with_firebase/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:go_egypt_with_firebase/core/widgets/global_text_buttom.dart';
import 'package:go_egypt_with_firebase/features/auth/data/models/signup_model.dart';
// import 'package:go_egypt_with_firebase/features/auth/domain/entities/signup_entity.dart';
import 'package:go_egypt_with_firebase/features/profile/presentation/widgets/custom_editing_text_field.dart';
import 'package:go_egypt_with_firebase/generated/l10n.dart';

class EditingDialog {
  static Future<void> showEditDialog(BuildContext context, String id, String title, SignUpModel state) async {
    String editedValue = '';

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        SignUpModel user = SignUpModel(name: state.name,email: state.email,password: state.password,phone: state.phone);

        return AlertDialog(
          title: Text(
            '${S.of(context).edit} $title',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          content: CustomEditingTextField(
            id: id,
            onChanged: (value) {
              editedValue = value;
            },
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomTextButton(
                  text: S.of(context).confirm,
                  onPressed: () async {
                    switch (id) {
                      case 'name':
                        user = SignUpModel(
                          name: editedValue,
                          email: state.email,
                          password: state.password,
                          phone: state.phone,
                        );
                        break;
                      case 'phone':
                        user = SignUpModel(
                          name: state.name,
                          email: state.email,
                          password: state.password,
                          phone: editedValue,
                        );
                        break;
                      case 'password':
                        user = SignUpModel(
                          name: state.name,
                          email: state.email,
                          password: editedValue,
                          phone: state.phone,
                        );
                        // await FirebaseAuth.instance.currentUser!
                        //     .updatePassword(editedValue);
                        break;
                      default:
                    }
                    context
                        .read<ProfileBloc>()
                        .add(UpdateProfile(profileData: user));
                    Navigator.pop(context);
                    SnackBar snackBar = SnackBar(
                      content:
                      Text(S.of(context).profile_has_successfully_updated),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                ),
                CustomTextButton(
                  text: S.of(context).back,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
