import 'package:flutter/material.dart';
import 'package:food_app/palette.dart';

class NameInput extends StatelessWidget {
  final IconData prefixIcon;
  final String hint;
  final Function onSaved;
  final TextInputType inputType;
  final TextInputAction inputAction;

  NameInput({
    @required this.prefixIcon,
    @required this.hint,
    @required this.onSaved,
    @required this.inputType,
    @required this.inputAction,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: kInputTextField,
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
            size: 22.0,
            color: Colors.white70,
          ),
        ),
      ),
      keyboardType: inputType,
      textInputAction: inputAction,
      validator: (value) {
        if (value.isEmpty || value == null) {
          return "Please enter your name";
        } else {
          return null;
        }
      },
      onSaved: (value) => onSaved(value),
    );
  }
}
