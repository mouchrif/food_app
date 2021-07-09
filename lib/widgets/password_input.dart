import 'package:flutter/material.dart';

import '../palette.dart';

class PasswordInput extends StatelessWidget {
  final IconData prefixIcon;
  final IconData suffixIconHiden;
  final IconData suffixIconShowen;
  final String hint;
  final Function onSaved;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final Function toggleHidden;
  final bool isHidden;

  PasswordInput(
      {@required this.prefixIcon,
      @required this.suffixIconHiden,
      @required this.suffixIconShowen,
      @required this.hint,
      @required this.onSaved,
      this.inputType,
      this.inputAction,
      this.toggleHidden,
      this.isHidden});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value.isEmpty || value == null) {
          return "Please insert your password";
        } else if (value.length < 4) {
          return "You have to enter at least 4 characters";
        } else {
          return null;
        }
      },
      onSaved: (value) => onSaved(value),
      obscureText: isHidden,
      style: kInputTextField,
      keyboardType: inputType,
      textInputAction: inputAction,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[600].withOpacity(0.5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(
            width: 2.0,
            color: Theme.of(context).primaryColor,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
        hintText: hint,
        hintStyle: kHint,
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Icon(
            prefixIcon,
            color: Colors.white70,
            size: 22.0,
          ),
        ),
        suffixIcon: IconButton(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          splashRadius: 26.0,
          iconSize: 22.0,
          icon: Icon(
            isHidden ? suffixIconHiden : suffixIconShowen,
            color: Colors.white70,
            size: 22.0,
          ),
          onPressed: toggleHidden,
        ),
      ),
    );
  }
}
