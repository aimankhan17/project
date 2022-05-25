import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task/main.dart';
import 'package:task/src/ui/template/check_box.dart';
import 'package:task/src/ui/template/textfield_border.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final TextEditingController passwordController = TextEditingController();

  bool offlinePayment = false;

  Widget _email() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .89,
      child: TextFormField(
        controller: emailController,
        textAlign: TextAlign.left,
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
        controller: passwordController,
        textAlign: TextAlign.left,
        style: const TextStyle(
            fontSize: 17,
            // height: 1.55,
            fontWeight: FontWeight.normal),
        textInputAction: TextInputAction.go,
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

  paymentFloating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          checkColor: Colors.white,
          fillColor: MaterialStateProperty.resolveWith(getColor),
          value: offlinePayment,
          onChanged: (bool? value) {
            setState(() {
              offlinePayment = value!;
            });
          },
        ),
        const Text(
          "Remember me",
          style: TextStyle(color: Colors.blueGrey),
        ),
        const Text(
          "Forget Password?",
          style: TextStyle(color: Colors.blue),
        ),
      ],
    );
  }

  Widget button() {
    return SizedBox(
        height: 50,
        width: MediaQuery.of(context).size.width * .40,
        child: TextButton(
          onPressed: () {},
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
          onPressed: () {},
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
            loginTapped();
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
    return RichText(
      text: const TextSpan(
        children: <TextSpan>[
          TextSpan(
              text: 'Donot have an account',
              style: TextStyle(color: Colors.grey)),
          TextSpan(text: ' Signup', style: TextStyle(color: Colors.green)),
        ],
      ),
    );
  }

  // Widget descriptiontext() {
  //   return RichText(
  //     text: const TextSpan(
  //       children: <TextSpan>[
  //         TextSpan(
  //             text: 'By continuing you agree Hapnezz',
  //             style: TextStyle(color: Colors.grey)),
  //         TextSpan(text: ' Term Of use', style: TextStyle(color: Colors.green)),
  //         TextSpan(text: ' and confirm', style: TextStyle(color: Colors.grey)),
  //       ],
  //     ),
  //   );
  // }

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
                      child: const Text('Welcome to, \nHappnezz',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                          )))
                  : Container(
                      padding: const EdgeInsets.only(left: 20),
                      alignment: Alignment.topLeft,
                      child: const Text(
                       'Welcome to, \nHappnezz',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                        ),
                      ),
                    ),
             
              // Container(
              //   padding: const EdgeInsets.only(left: 20),
              //   alignment: Alignment.topLeft,
              //   child: const Text(
              //     'Welcome to, \nHappnezz',
              //     style: TextStyle(
              //       fontSize: 30,
              //       color: Colors.white,
              //     ),
              //   ),
              // ),
              const SizedBox(height: 20),
              _email(),
              const SizedBox(height: 15),
              _password(),
              const SizedBox(height: 15),
              login(),
              const SizedBox(height: 9),
              paymentFloating(),
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
              const SizedBox(height: 40),
              Align(alignment: Alignment.bottomCenter, child: descriptiontext())
            ]),
      ),
    );
  }

  Future<void> loginTapped() async {
    String email = emailController.text;
    String password = passwordController.text;
    // String confirmPassword = _confirmPasswordController.text;

    // final prefs = await SharedPreferences.getInstance();

    try {
      final UserCredential _authCredentials = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      User? user = _authCredentials.user;

      // prefs.setString(prefs_username, name);
      print("user${user!.uid}");

      var snackBar = SnackBar(content: Text(user.uid));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      await user.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      print("Firebase exception: ${e.message}");
    }
  }
}
