import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task/main.dart';
import 'package:task/src/ui/template/textfield_border.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailController = TextEditingController();
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final TextEditingController passwordController = TextEditingController();

  Widget _email() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .89,
      child: TextFormField(
        textAlign: TextAlign.left,
        controller: emailController,
        style: const TextStyle(
            fontSize: 17,
            // height: 1.55,
            fontWeight: FontWeight.normal),
        textInputAction: TextInputAction.go,
        keyboardType: TextInputType.name,
        autocorrect: false,
        decoration: InputDecoration(
          hintText: "Email@youremail.com",
          hintStyle: const TextStyle(
              // fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Colors.grey),
          filled: true,
          fillColor: const Color.fromARGB(255, 72, 72, 72),
          enabledBorder: textFieldBorder(),
          focusedBorder: textFieldBorder(),
        ),
      ),
    );
  }

  Widget _password() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .89,
      child: TextFormField(
        textAlign: TextAlign.left,
        style: const TextStyle(
            fontSize: 17,
            // height: 1.55,
            fontWeight: FontWeight.normal),
        textInputAction: TextInputAction.go,
        controller: passwordController,
        keyboardType: TextInputType.name,
        autocorrect: false,
        decoration: InputDecoration(
          hintText: "Password",
          hintStyle: const TextStyle(
              // fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Colors.grey),
          filled: true,
          fillColor: const Color.fromARGB(255, 72, 72, 72),
          enabledBorder: textFieldBorder(),
          focusedBorder: textFieldBorder(),
        ),
      ),
    );
  }

  Widget _number(String hint) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .89,
      child: TextFormField(
        textAlign: TextAlign.left,
        style: const TextStyle(
            fontSize: 17,
            // height: 1.55,
            fontWeight: FontWeight.normal),
        textInputAction: TextInputAction.go,
        keyboardType: TextInputType.name,
        autocorrect: false,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
              // fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Colors.grey),
          filled: true,
          fillColor: const Color.fromARGB(255, 72, 72, 72),
          enabledBorder: textFieldBorder(),
          focusedBorder: textFieldBorder(),
        ),
      ),
    );
  }

  Widget button() {
    return SizedBox(
        height: 50,
        width: MediaQuery.of(context).size.width * .40,
        child: TextButton(
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //       builder: (BuildContext context) =>
            //           const LoginScreen()),
            // );
          },
          child: const Text(
            'Google',
            style: TextStyle(
              fontSize: 22.0,
              color: Colors.white,
            ),
          ),
          style: TextButton.styleFrom(
            primary: Colors.white,
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ));
  }

  Widget buttontext() {
    return SizedBox(
        height: 50,
        width: MediaQuery.of(context).size.width * .40,
        child: TextButton(
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //       builder: (BuildContext context) =>
            //           const LoginScreen()),
            // );
          },
          child: const Text(
            'Facebook',
            style: TextStyle(
              fontSize: 22.0,
              color: Colors.white,
            ),
          ),
          style: TextButton.styleFrom(
            primary: Colors.white,
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ));
  }

  Widget login() {
    return SizedBox(
        height: 50,
        width: MediaQuery.of(context).size.width * .90,
        child: TextButton(
          onPressed: () {
            signUpTapped();
          },
          child: const Text(
            'Login Hapnezz',
            style: TextStyle(
              fontSize: 22.0,
              color: Colors.white,
            ),
          ),
          style: TextButton.styleFrom(
            primary: Colors.white,
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ));
  }

  Widget descriptiontext() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RichText(
          text: const TextSpan(
            children: <TextSpan>[
              TextSpan(
                  text: 'By continuing you agree Hapnezz',
                  style: TextStyle(color: Colors.grey)),
              TextSpan(
                  text: ' Term Of use', style: TextStyle(color: Colors.green)),
              TextSpan(
                  text: ' and confirm', style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        RichText(
          text: const TextSpan(
            children: <TextSpan>[
              TextSpan(
                  text: 'that you have read Hapnezz',
                  style: TextStyle(color: Colors.grey)),
              TextSpan(
                  text: ' Privacy Policy',
                  style: TextStyle(color: Colors.green)),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.navigate_before,
            size: 36,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
             
              MyApp.themeNotifier.value == ThemeMode.light
                  ? Container(
                      padding: const EdgeInsets.only(left: 20),
                      alignment: Alignment.topLeft,
                      child: const Text('Sign up to, \nHappnezz',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                          )))
                  : Container(
                      padding: const EdgeInsets.only(left: 20),
                      alignment: Alignment.topLeft,
                      child: const Text(
                        'Sign up to, \nHappnezz',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                        ),
                      ),
                    ),
              const SizedBox(height: 20),
              _email(),
              const SizedBox(height: 15),
              _password(),
              const SizedBox(height: 15),
              _number("Re-type your password"),
              const SizedBox(height: 15),
              login(),
              const SizedBox(height: 20),
              const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "OR",
                    style: TextStyle(color: Colors.white),
                  )),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  button(),
                  buttontext(),
                ],
              ),
              const SizedBox(height: 15),
              descriptiontext()
            ]),
      ),
    );
  }

  Future<void> signUpTapped() async {
    String email = emailController.text;
    String password = passwordController.text;

    try {
      final UserCredential _authCredentials = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      User? user = _authCredentials.user;

      print("user${user!.uid}");

      var snackBar = SnackBar(content: Text(user.uid));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      await user.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      print("Firebase exception: ${e.message}");
    }
  }
}
