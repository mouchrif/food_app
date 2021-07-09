import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../palette.dart';

class TextInput extends StatelessWidget {
  final IconData icon;
  final String hint;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final Function onSaved;

  TextInput({
    @required this.icon,
    @required this.hint,
    this.inputType,
    this.inputAction,
    @required this.onSaved,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        final String _emailPatern =
            "^(?=.{1,64}@)[A-Za-z0-9_-]+(\\.[A-Za-z0-9_-]+)*@" +
                "[^-][A-Za-z0-9_-]+(\\.[A-Za-z0-9_-]+)*(\\.[A-Za-z]{2,})";
        final RegExp exp = RegExp(_emailPatern);
        if (value.isEmpty) {
          return "Please enter your email adress";
        } else if (!exp.hasMatch(value)) {
          return "Please enter a valid email adress";
        } else {
          return null;
        }
      },
      onSaved: (value) => onSaved(value),
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
            icon,
            color: Colors.white70,
            size: 22.0,
          ),
        ),
      ),
    );
  }
}
