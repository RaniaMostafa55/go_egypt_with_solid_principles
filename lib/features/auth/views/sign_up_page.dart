import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_egypt_with_firebase/core/blocs/auth/auth_bloc.dart';
import 'package:go_egypt_with_firebase/dialog_utils.dart';
import 'package:go_egypt_with_firebase/features/auth/views/login_page.dart';
import 'package:go_egypt_with_firebase/features/auth/widgets/auth_text_button.dart';
import 'package:go_egypt_with_firebase/features/layout/layout_view.dart';
import 'package:go_egypt_with_firebase/generated/l10n.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/title_text.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();
  bool isPassHidden = true;
  late final TextEditingController fullnameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    fullnameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    phoneController = TextEditingController();
  }

  @override
  void dispose() {
    fullnameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          DialogUtils.showLoading(context: context);
        } else if (state is AuthAuthenticated) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context,
              message: 'Account Created successfully',
              title: 'Register',
              posMessageName: 'Ok',
              posAction: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LayoutView()));
              });
        } else if (state is AuthError) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context,
              message: state.message ?? "",
              title: 'Error',
              posMessageName: 'Ok');
        }
      },
      child: Scaffold(
        //use "SingleChildScrollView" to make the page scrollable
        body: Center(
          child: SingleChildScrollView(
            //use bouncing physics while scrolling
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: _signUpFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //call "TitleText" widget to add the title of the page
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: TitleText(
                      S.of(context).sign_up,
                      40,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  //call "CustomTextField" to ask the user to enter his full name and validate his input
                  CustomTextField(
                    controller: fullnameController,
                    label: S.of(context).full_name,
                    prefix: Icons.person,
                    //use "validator" to check if the user input meets requirements
                    validator: (value) {
                      if (value!.isEmpty) {
                        return S.of(context).please_enter_your_full_name;
                      } else if (!RegExp(r'[A-Z]').hasMatch(value[0])) {
                        return S.of(context).first_letter_should_be_capitalized;
                      } else {
                        return null;
                      }
                    },
                  ),
                  //ask the user to enter his email address
                  CustomTextField(
                    controller: emailController,
                    label: S.of(context).email_address,
                    prefix: Icons.email,
                    validator: (value) {
                      if (!value!.contains("@")) {
                        return S.of(context).please_enter_a_valid_email;
                      } else {
                        return null;
                      }
                    },
                  ),
                  //call "CustomTextField" to ask the user to enter his password
                  CustomTextField(
                    controller: passwordController,
                    label: S.of(context).password,
                    prefix: Icons.lock,
                    validator: (value) {
                      if (value!.length < 6) {
                        return S
                            .of(context)
                            .password_should_contain_at_least_6_characters;
                      } else {
                        return null;
                      }
                    },
                    isPassword: true,
                    obscureText: isPassHidden,
                    //convert the value of "signUpIsPassHidden" variable when pressing the suffix icon to show and hide password
                    onSuffixPressed: () {
                      setState(() {
                        isPassHidden = !isPassHidden;
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: IntlPhoneField(
                      controller: phoneController,
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      initialCountryCode: 'EG',
                      validator: (value) {
                        if (value.toString().contains(" ")) {
                          phoneController.text =
                              phoneController.text.replaceAll(" ", "");
                        }
                        return null;
                      },
                    ),
                  ),
                  //call "CustomButton" to add a "sign up" button
                  CustomButton(
                    onPressed: () async {
                      //if the user inputs meet all requirements, an alert dialog will show up using "signUpDialog" function
                      if (_signUpFormKey.currentState!.validate()) {
                        //caching data using shared preferences
                        final SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setString("name", fullnameController.text);
                        prefs.setString("email", emailController.text);
                        prefs.setString("pass", passwordController.text);
                        prefs.setString("phone", phoneController.text);
                        context.read<AuthBloc>().signUp(
                            username: fullnameController.text,
                            emailAddress: emailController.text,
                            password: passwordController.text,
                            phone: phoneController.text,
                            context: context);
                      }
                    },
                    text: S.of(context).sign_up,
                  ),
                  AuthTextButton(
                    text: "Already have an account? ",
                    buttonText: "Sign in",
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return LoginPage();
                        },
                      ));
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
