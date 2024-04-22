import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:socialchatapp/index.dart";

class LogInScreen extends StatelessWidget {
  LogInScreen({
    super.key,
  });

  final _emailController = TextEditingController();
  final _paswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus =
              FocusScope.of(context); //get current focus node
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Container(
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
                      "assets/images/chatting.png",
                      height: 250,
                      width: 250,
                    ),
                    SizedBox(
                      height: 20,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(color: Appcolors.myTeal),
                            ),
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () async {
                        FocusScopeNode currentFocus =
                            FocusScope.of(context); //get current focus node
                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
                        await Authentication()
                            .logInUser(
                                email: _emailController.text,
                                password: _paswordController.text)
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
                            "Sign In",
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
                          text: "Don't have an account?",
                          style:
                              TextStyle(color: Appcolors.myTeal, fontSize: 18),
                        ),
                        TextSpan(
                            text: " Sign Up",
                            style: TextStyle(
                                color: Appcolors.myPurple,
                                decoration: TextDecoration.underline,
                                fontSize: 18),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacementNamed(
                                    context, Routes.signUpScreen);
                              }),
                      ])),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
