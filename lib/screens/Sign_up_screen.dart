import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/widgets/password_input.dart';

import '../widgets/name_input.dart';
import '../widgets/background_img.dart';
import '../palette.dart';
import '../widgets/elevated_button.dart';
import '../widgets/email_input.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = "/sign-up";

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String name = "";
  String emailAdress = "";
  String password = "";
  String confirmPassword = "";
  final _formKey = GlobalKey<FormState>();
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    void onSaved(String value) {
      setState(() {
        name = value;
      });
    }

    void onEmailSaved(String value) {
      setState(() {
        emailAdress = value;
      });
    }

    void onPasswordSaved(String value) {
      setState(() {
        password = value;
      });
    }

    void onPasswordConfirmSaved(String value) {
      setState(() {
        confirmPassword = value;
      });
    }

    void toggleHidden() {
      setState(() {
        isHidden = !isHidden;
      });
    }
    return Stack(
      children: [
        BackgroundImg(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Container(
                    height: 140.0,
                    child: Center(
                      child: Text(
                        "Foudy",
                        style: kHeader,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Form(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Column(
                            children: [
                              NameInput(
                                prefixIcon: FontAwesomeIcons.user,
                                hint: "User",
                                inputType: TextInputType.name,
                                inputAction: TextInputAction.next,
                                onSaved: onSaved,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              TextInput(
                                icon: FontAwesomeIcons.envelope,
                                hint: "Email",
                                inputType: TextInputType.emailAddress,
                                inputAction: TextInputAction.next,
                                onSaved: onEmailSaved,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              PasswordInput(
                                prefixIcon: FontAwesomeIcons.lock,
                                suffixIconHiden: FontAwesomeIcons.eye,
                                suffixIconShowen: FontAwesomeIcons.eyeSlash,
                                hint: "Password",
                                inputType: TextInputType.visiblePassword,
                                inputAction: TextInputAction.next,
                                toggleHidden: toggleHidden,
                                isHidden: isHidden,
                                onSaved: onPasswordSaved,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              PasswordInput(
                                prefixIcon: FontAwesomeIcons.lock,
                                suffixIconHiden: FontAwesomeIcons.eye,
                                suffixIconShowen: FontAwesomeIcons.eyeSlash,
                                hint: "Confirm your password",
                                inputType: TextInputType.visiblePassword,
                                inputAction: TextInputAction.done,
                                toggleHidden: toggleHidden,
                                isHidden: isHidden,
                                onSaved: onPasswordConfirmSaved,
                              ),
                              SizedBox(
                                height: 90.0,
                              ),
                              ElevatedBtn(
                                text: "Sign Up",
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xFFFFC529).withOpacity(0.8)),
                                shadowColor: MaterialStateProperty.all(
                                    Theme.of(context).primaryColor),
                                onPressed: () {
                                  _formKey.currentState.save();
                                  final bool isValid =
                                      _formKey.currentState.validate();
                                  if (isValid) {
                                    print("$name");
                                  }
                                },
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16.0,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Already have an account ? ",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        print("already have an account...");
                                        Navigator.pushNamed(context, "/");
                                      },
                                      child: Text(
                                        "Sign In",
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      highlightColor: Colors.transparent,
                                      overlayColor: MaterialStateProperty.all(
                                          Colors.transparent),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
