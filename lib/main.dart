import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:task/src/configs/local-storage.dart';
import 'package:task/src/ui/login_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'src/ui/signup_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(primarySwatch: Colors.amber),
            darkTheme: ThemeData.dark(),
            themeMode: currentMode,
            home: const WelcomeScreen(),
          );
        });
  }
}

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    Storage.initialize();
  }

  Widget _languageChangeButton() {
    return TextButton(
      onPressed: () {
        if (Storage.getValue("language") == "english") {
          Storage.setValue("language", "urdu");
          setState(() {});
        } else if (Storage.getValue("language") == "urdu") {
          Storage.setValue("language", "english");
          setState(() {});
        }
      },
      child: Storage.getValue("language") == "english"
          ? Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Icon(
                  Icons.language,
                  color: Colors.black87,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 8, left: 4),
                  child: Text(
                    'EN',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            )
          : Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 2, left: 8),
                  child: Text(
                    'اردو',
                    style: TextStyle(color: Colors.lightGreen),
                  ),
                ),
                const Icon(
                  Icons.language,
                  color: Colors.black87,
                ),
              ],
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          _languageChangeButton(),
          IconButton(
              icon: Icon(MyApp.themeNotifier.value == ThemeMode.light
                  ? Icons.dark_mode
                  : Icons.light_mode),
              onPressed: () {
                MyApp.themeNotifier.value =
                    MyApp.themeNotifier.value == ThemeMode.light
                        ? ThemeMode.dark
                        : ThemeMode.light;
              })
        ],
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MyApp.themeNotifier.value == ThemeMode.light
                ? Container(
                    padding: const EdgeInsets.only(left: 20),
                    alignment: Alignment.bottomCenter,
                    child: const Text('Welcome to, \nHappnezz.',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                        )))
                : Container(
                    padding: const EdgeInsets.only(left: 20),
                    alignment: Alignment.bottomCenter,
                    child: const Text(
                      'Welcome to, \nHappnezz.',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * .90,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const LoginScreen()),
                    );
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
                )),
            const SizedBox(height: 8),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * .90,
              child: TextButton(
                  onPressed: () {
                    var push = Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const SignupScreen()),
                    );
                  },
                  child: const Text(
                    'Signup',
                    style: TextStyle(
                      fontSize: 22.0,
                      // color: Colors.white
                      // color: Colors.transparent
                    ),
                  ),
                  style: TextButton.styleFrom(
                    side: const BorderSide(color: Colors.green),
                    primary: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              AppLocalizations.of(context)!.hello,
            ),
          ]),
    );
  }
}


// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:task/src/configs/local-storage.dart';
// import 'package:task/src/ui/login_screen.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// import 'src/ui/signup_screen.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();

//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   static final ValueNotifier<ThemeMode> themeNotifier =
//       ValueNotifier(ThemeMode.light);

//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder<ThemeMode>(
//         valueListenable: themeNotifier,
//         builder: (_, ThemeMode currentMode, __) {
//           return MaterialApp(
//             localizationsDelegates: AppLocalizations.localizationsDelegates,
//             supportedLocales: AppLocalizations.supportedLocales,
//             debugShowCheckedModeBanner: false,
//             theme: ThemeData(primarySwatch: Colors.amber),
//             darkTheme: ThemeData.dark(),
//             themeMode: currentMode,
//             home: const WelcomeScreen(),
//           );
//         });
//   }
// }

// class WelcomeScreen extends StatefulWidget {
//   const WelcomeScreen({Key? key}) : super(key: key);

//   @override
//   State<WelcomeScreen> createState() => _WelcomeScreenState();
// }

// class _WelcomeScreenState extends State<WelcomeScreen> {
//   @override
//   void initState() {
//     super.initState();

//     print(Storage.getValue("language"));
//   }

//   Widget _languageChangeButton() {
//     return TextButton(
//       onPressed: () {
//         print("Language changed Button pressed");
//         print("Language Change Button Pressed");
//         if (Storage.getValue("language") == "english") {
//           Storage.setValue("language", "urdu");
//           setState(() {});
//         } else if (Storage.getValue("language") == "urdu") {
//           Storage.setValue("language", "english");
//           setState(() {});
//         }
//       },
//       child: Storage.getValue("language") != "english"
//           ? Row(
//               // ignore: prefer_const_literals_to_create_immutables
//               children: [
//                 const Icon(
//                   Icons.language,
//                   color: Colors.black87,
//                 ),
//                 const Padding(
//                   padding: EdgeInsets.only(right: 8, left: 4),
//                   child: Text(
//                     'EN',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ],
//             )
//           : Row(
//               // ignore: prefer_const_literals_to_create_immutables
//               children: [
//                 const Padding(
//                   padding: EdgeInsets.only(right: 2, left: 8),
//                   child: Text(
//                     'اردو',
//                     style: TextStyle(color: Colors.lightGreen),
//                   ),
//                 ),
//                 const Icon(
//                   Icons.language,
//                   color: Colors.black87,
//                 ),
//               ],
//             ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           _languageChangeButton(),
//           IconButton(
//               icon: Icon(MyApp.themeNotifier.value == ThemeMode.light
//                   ? Icons.dark_mode
//                   : Icons.light_mode),
//               onPressed: () {
//                 MyApp.themeNotifier.value =
//                     MyApp.themeNotifier.value == ThemeMode.light
//                         ? ThemeMode.dark
//                         : ThemeMode.light;
//               })
//         ],
//       ),
//       body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             MyApp.themeNotifier.value == ThemeMode.light
//                 ? Container(
//                     padding: const EdgeInsets.only(left: 20),
//                     alignment: Alignment.bottomCenter,
//                     child: const Text('Welcome to, \nHappnezz.',
//                         style: TextStyle(
//                           fontSize: 30,
//                           color: Colors.black,
//                         )))
//                 : Container(
//                     padding: const EdgeInsets.only(left: 20),
//                     alignment: Alignment.bottomCenter,
//                     child: const Text(
//                       'Welcome to, \nHappnezz.',
//                       style: TextStyle(
//                         fontSize: 30,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//             const SizedBox(
//               height: 8,
//             ),
//             SizedBox(
//                 height: 50,
//                 width: MediaQuery.of(context).size.width * .90,
//                 child: TextButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (BuildContext context) =>
//                               const LoginScreen()),
//                     );
//                   },
//                   child: const Text(
//                     'Login Hapnezz',
//                     style: TextStyle(
//                       fontSize: 22.0,
//                       color: Colors.white,
//                     ),
//                   ),
//                   style: TextButton.styleFrom(
//                     primary: Colors.white,
//                     backgroundColor: Colors.green,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                   ),
//                 )),
//             const SizedBox(height: 8),
//             SizedBox(
//               height: 50,
//               width: MediaQuery.of(context).size.width * .90,
//               child: TextButton(
//                   onPressed: () {
//                     var push = Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (BuildContext context) =>
//                               const SignupScreen()),
//                     );
//                   },
//                   child: const Text(
//                     'Signup',
//                     style: TextStyle(
//                       fontSize: 22.0,
//                       // color: Colors.white
//                       // color: Colors.transparent
//                     ),
//                   ),
//                   style: TextButton.styleFrom(
//                     side: const BorderSide(color: Colors.green),
//                     primary: Colors.green,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                   )),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Text(
//               AppLocalizations.of(context)!.hello,
//             ),
//           ]),
//     );
//   }
// }
