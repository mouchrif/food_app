/*
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/background_img.dart';
import '../palette.dart';
import '../widgets/text_input.dart';
import '../widgets/password_input.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final textInputController = TextEditingController();
  final passwordInputController = TextEditingController();
  bool isHidden = true;

  @override
  void dispose() {
    textInputController.dispose();
    passwordInputController.dispose();
    super.dispose();
  }

  void toggleHidden() {
    setState(() {
      isHidden = !isHidden;
    });
    print(isHidden);
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
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: TextInput(
                                icon: FontAwesomeIcons.envelope,
                                hint: "Email",
                                textInput: textInputController,
                                inputType: TextInputType.emailAddress,
                                inputAction: TextInputAction.next,
                              ),
                            ),
                            PasswordInput(
                              prefixIcon: FontAwesomeIcons.lock,
                              suffixIconHiden: FontAwesomeIcons.eyeSlash,
                              suffixIconShowen: FontAwesomeIcons.eye,
                              hint: "Password",
                              passwordInputF: passwordInputController,
                              inputType: TextInputType.visiblePassword,
                              inputAction: TextInputAction.done,
                              toggleHidden: toggleHidden,
                              isHidden: isHidden,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 26.0),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 6.0),
                          ),
                          child: Text("Forgot password ?"),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 90.0,
                  ),
                  ElevatedButton(
                    child: Text("Login"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color(0xFFFFC529).withOpacity(0.8)),
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                        vertical: 14.0,
                        horizontal: 85.0,
                      )),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      )),
                      textStyle: MaterialStateProperty.all(TextStyle(
                        fontSize: 20.0,
                      )),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Text("Your informations are"),
                          content: Container(
                            height: 100.0,
                            child: Column(
                              children: [
                                Text("Email: ${textInputController.text}"),
                                Text("Password: ${passwordInputController.text}"),
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
                      );
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: TextButton(
                      style: TextButton.styleFrom(primary: Colors.white),
                      child: Text("Create new account"),
                      onPressed: () {},
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
*/
