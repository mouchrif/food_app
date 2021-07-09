import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/widgets/elevated_button.dart';

import '../screens/Sign_up_screen.dart';
import '../widgets/background_img.dart';
import '../palette.dart';
import '../widgets/email_input.dart';
import '../widgets/password_input.dart';

class LoginFormPage extends StatefulWidget {
  @override
  _LoginFormPageState createState() => _LoginFormPageState();
}

class _LoginFormPageState extends State<LoginFormPage> {
  bool isHidden = true;
  bool isError = false;
  final _formKey = GlobalKey<FormState>();
  String _emailAdress = "";
  String _password = "";

  void toggleHidden() {
    setState(() {
      isHidden = !isHidden;
    });
  }

  void onPasswordSaved(value) {
    setState(() {
      _password = value;
    });
  }

  void onEmailSaved(value) {
    setState(() {
      _emailAdress = value;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    height: 200.0,
                    child: Center(
                      child: Text(
                        "Foudy",
                        style: kHeader,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Form(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: TextInput(
                                  icon: FontAwesomeIcons.envelope,
                                  hint: "Email",
                                  inputType: TextInputType.emailAddress,
                                  inputAction: TextInputAction.next,
                                  onSaved: onEmailSaved,
                                ),
                              ),
                              PasswordInput(
                                prefixIcon: FontAwesomeIcons.lock,
                                suffixIconHiden: FontAwesomeIcons.eye,
                                suffixIconShowen: FontAwesomeIcons.eyeSlash,
                                hint: "Password",
                                inputType: TextInputType.visiblePassword,
                                inputAction: TextInputAction.done,
                                toggleHidden: toggleHidden,
                                isHidden: isHidden,
                                onSaved: onPasswordSaved,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 26.0),
                        padding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                        ),
                        child: InkWell(
                          onTap: () {
                            print("forgot password...");
                          },
                          child: Text(
                            "Forgot password ?",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                            ),
                          ),
                          highlightColor: Colors.transparent,
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 90.0,
                  ),
                  ElevatedBtn(
                    text: "Login", 
                    backgroundColor: MaterialStateProperty.all(Color(0xFFFFC529).withOpacity(0.8)), 
                    shadowColor: MaterialStateProperty.all(Theme.of(context).primaryColor), 
                    onPressed: (){
                      final _isValid = _formKey.currentState.validate();
                      if (_isValid) {
                        FocusScope.of(context).unfocus();
                        _formKey.currentState.save();
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: Text("Your informations are :"),
                            content: Container(
                              height: 100.0,
                              child: Column(
                                children: [
                                  Text("Email: $_emailAdress"),
                                  Text("Password: $_password"),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                style: TextButton.styleFrom(
                                  primary: Theme.of(context).primaryColor,
                                  textStyle: TextStyle(fontSize: 18.0),
                                ),
                                child: Text("Okay"),
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                },
                              ),
                            ],
                          ),
                        ).then((value) => _formKey.currentState.reset());
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
                          "Don't have account ? ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            print("Create new password...");
                            Navigator.pushNamed(context,SignUpScreen.routeName);
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          highlightColor: Colors.transparent,
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                        ),
                      ],
                    ),
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
