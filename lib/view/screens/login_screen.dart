import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:socialchatapp/index.dart";
import "package:socialchatapp/view/utility/utils.dart";

class LogInScreen extends StatefulWidget {
  LogInScreen({
    super.key,
  });

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _emailController = TextEditingController();
  final _paswordController = TextEditingController();
  bool isLoggedIn = false;

  logInUser() async {
    setState(() {
      isLoggedIn = false;
    });
    FocusScopeNode currentFocus =
        FocusScope.of(context); //get current focus node
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
    await Authentication()
        .logInUser(
            email: _emailController.text, password: _paswordController.text)
        .then((value) {
      setState(() {
        isLoggedIn = true;
      });
      showSnackbar(context, value);
      _emailController.text = "";
      _paswordController.text = "";
    });
  }

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
                            onPressed: () {
                              Navigator.pushNamed(context, Routes.userProfile);
                            },
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(color: Appcolors.myTeal),
                            ),
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: logInUser,
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Appcolors.myPurple),
                        child: Center(
                          child: isLoggedIn
                              ? const Text(
                                  "Sign In",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                )
                              : const CircularProgressIndicator(
                                  color: Colors.white,
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
