import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:socialchatapp/index.dart";

class SignUpScreen extends StatelessWidget {
  SignUpScreen({
    super.key,
  });

  final _emailController = TextEditingController();
  final _paswordController = TextEditingController();
  final _userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: Appcolors.appBackground,
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/chat.png",
                    height: 250,
                    width: 250,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AuthTextField(
                    controller: _userNameController,
                    label: 'Username',
                    inputType: TextInputType.text,
                    obscuretext: false,
                  ),
                  AuthTextField(
                    controller: _emailController,
                    label: 'Email',
                    inputType: TextInputType.emailAddress,
                    obscuretext: false,
                  ),
                  AuthTextField(
                      controller: _paswordController,
                      label: "Password",
                      inputType: TextInputType.text,
                      obscuretext: true),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () async {
                      await Authentication()
                          .signUpUser(
                              email: _emailController.text,
                              password: _paswordController.text,
                              userName: _userNameController.text)
                          .then((value) => print(value));
                    },
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Appcolors.myPurple),
                      child: const Center(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Text.rich(TextSpan(children: [
                      TextSpan(
                        text: "Already have an account?",
                        style: TextStyle(color: Appcolors.myTeal, fontSize: 18),
                      ),
                      TextSpan(
                          text: " Sign In",
                          style: TextStyle(
                              color: Appcolors.myPurple,
                              decoration: TextDecoration.underline,
                              fontSize: 18),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacementNamed(
                                  context, Routes.logInScreen);
                            }),
                    ])),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
