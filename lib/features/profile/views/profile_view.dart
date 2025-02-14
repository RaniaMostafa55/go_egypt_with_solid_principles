import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_egypt_with_firebase/core/blocs/auth/auth_bloc.dart';
import 'package:go_egypt_with_firebase/core/blocs/profile/profile_bloc.dart';
import 'package:go_egypt_with_firebase/core/blocs/theme_bloc/theme_bloc.dart';
import 'package:go_egypt_with_firebase/core/core_cubits/language_cubit.dart';
import 'package:go_egypt_with_firebase/dialog_utils.dart';
import 'package:go_egypt_with_firebase/features/auth/views/login_page.dart';
import 'package:go_egypt_with_firebase/features/profile/widgets/custom_list_tile.dart';
import 'package:go_egypt_with_firebase/features/profile/widgets/profile_pic_frame.dart';
import 'package:go_egypt_with_firebase/features/profile/widgets/show_editing_dialog.dart';
import 'package:go_egypt_with_firebase/generated/l10n.dart';
import 'package:local_auth/local_auth.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool isAuthenticated = false;
  @override
  void initState() {
    super.initState();
    // Load profile data when the view is initialized
    context.read<ProfileBloc>().add(LoadProfile());
     authenticate();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    if(isAuthenticated) {
      return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            DialogUtils.showLoading(context: context);
          });
        } else if (state is AuthUnauthenticated) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(
              context: context,
              message: 'Logout successfully',
              title: 'Logout',
              posMessageName: 'Ok',
              posAction: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            );
          });
        } else if (state is AuthError) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(
              context: context,
              message: state.message ?? "",
              title: 'Error',
              posMessageName: 'Ok',
            );
          });
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(S
              .of(context)
              .profile),
          automaticallyImplyLeading: false,
          actions: [
            BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                return IconButton(
                  onPressed: () {
                    BlocProvider.of<ThemeBloc>(context).add(ToggleTheme());
                  },
                  icon: state is DarkModeState
                      ? Icon(Icons.light_mode)
                      : Icon(Icons.dark_mode),
                );
              },
            ),
          ],
        ),
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ProfileLoaded || state is ProfileUpdated) {
              final profile = (state is ProfileLoaded)
                  ? state.profile
                  : (state as ProfileUpdated).profile;

              return SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      children: [
                        SizedBox(height: 20),
                        ProfilePicFrame(
                          img: context
                              .watch<ProfileBloc>()
                              .deleteImagePath!,
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                    CustomListTile(
                      icon: Icons.person,
                      title: S
                          .of(context)
                          .full_name,
                      subtitle: profile.name,
                      id: 'name',
                      onPressed: () {
                        EditingDialog.showEditDialog(
                            context, 'name', S
                            .of(context)
                            .full_name, profile);
                      },
                    ),
                    CustomListTile(
                      icon: Icons.phone,
                      title: S
                          .of(context)
                          .phone_number,
                      subtitle: profile.phone,
                      id: 'phone',
                      onPressed: () {
                        EditingDialog.showEditDialog(context, 'phone',
                            S
                                .of(context)
                                .phone_number, profile);
                      },
                    ),
                    CustomListTile(
                      icon: Icons.mail_rounded,
                      title: S
                          .of(context)
                          .email_address,
                      subtitle: profile.email,
                      id: 'email',
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            "Email Address mustn't be changed",
                          ),
                          backgroundColor: Theme
                              .of(context)
                              .colorScheme
                              .error,
                        ));
                      },
                    ),
                    CustomListTile(
                      icon: Icons.password,
                      title: S
                          .of(context)
                          .password,
                      subtitle: hashedPassword(profile.password.length),
                      id: 'password',
                      onPressed: () {
                        EditingDialog.showEditDialog(context, 'password',
                            S
                                .of(context)
                                .password, profile);
                      },
                    ),
                    SizedBox(height: 20),
                    SizedBox(height: 20),
                    buildLanguageSwitcher(size),
                    TextButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(LogoutRequested());
                      },
                      child: Text('Logout'),
                    ),
                  ],
                ),
              );
            } else if (state is ProfileError) {
              return Center(child: Text(state.message));
            }
            return Center(child: Text('No data found'));
          },
        ),
      ),
    );
    }
    return SizedBox.shrink();
  }

  ToggleSwitch buildLanguageSwitcher(Size size) {
    return ToggleSwitch(
      radiusStyle: true,
      minWidth: 90.0,
      initialLabelIndex: Intl.getCurrentLocale() == "ar" ? 1 : 0,
      activeFgColor: Colors.white,
      inactiveBgColor: Colors.grey,
      inactiveFgColor: Colors.white,
      totalSwitches: 2,
      labels: ['English', 'العربية'],
      customTextStyles: [
        TextStyle(fontSize: 18),
        TextStyle(fontSize: 18),
      ],
      activeBgColors: [
        [Theme
            .of(context)
            .colorScheme
            .primary
        ],
        [Theme
            .of(context)
            .colorScheme
            .error
        ],
      ],
      animate: true,
      animationDuration: 200,
      customWidths: [size.width * 0.3, size.width * 0.3],
      onToggle: (index) {
        context.read<LanguageCubit>().toggleLanguage();
      },
    );
  }

  String hashedPassword(int passLength) {
    return '*' * passLength;
  }

  Future<void> authenticate() async {
    LocalAuthentication auth = LocalAuthentication();
    final bool canAuthenticateWithBiometric = await auth.canCheckBiometrics;
    if (canAuthenticateWithBiometric) {
      final bool didAuthenticate = await auth.authenticate(
          localizedReason: 'please,Authenticate to access Profile Page',
          options: AuthenticationOptions(biometricOnly: true));
      isAuthenticated= didAuthenticate;
    } else {
      isAuthenticated= false;

    }
    setState(() {

    });
  }
}
