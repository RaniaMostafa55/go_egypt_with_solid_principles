import 'package:flutter/material.dart';

//a class contains the design of the "textFormField" used in the app
class CustomTextField extends StatelessWidget {
  //the variables required in this class and must send values to them using constructor
  final TextEditingController controller;
  final String label;
  final IconData prefix;
  final String? Function(String?)? validator;
  final void Function()? onSuffixPressed;
  final bool? obscureText;
  final bool isPassword;
  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.prefix,
    required this.validator,
    this.onSuffixPressed,
    this.obscureText = false,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    //returns a "TextFormField" with specific values passed to the class
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
          //if it's a password field it will check if it's secure or not, else it will be false by default
          obscureText: obscureText!,
          controller: controller,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: label,
              //if it's a password field an "eye" icon will be added as a suffix icon, otherwise, a "SizedBox" widget will be added which means nothing
              suffixIcon: isPassword
                  ? IconButton(
                      onPressed: onSuffixPressed,
                      icon: Icon(
                        //check which icon to add based on the the value of "obscureText" variable which detects if it's secure or not
                        obscureText! ? Icons.visibility : Icons.visibility_off,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    )
                  : const SizedBox(),
              prefixIcon: Icon(
                prefix,
                color: Theme.of(context).colorScheme.primary,
              )),
          validator: validator),
    );
  }
}
