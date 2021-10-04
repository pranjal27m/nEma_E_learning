import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Pages/homePage.dart';
import 'Pages/loginPage.dart';
import 'Pages/signupPage.dart';
import 'Pages/reset.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

final FirebaseAuth _auth = FirebaseAuth.instance;
final User firebaseUser = _auth.currentUser;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "nEma",
      themeMode: ThemeMode.dark,
      initialRoute: '/',
      routes: {
        '/':(context) => AuthenticationWrapper(),
        '/loginPage':(context) => LoginPage(auth: _auth,),
        '/signupPage':(context) => SignupPage(_auth),
        '/homePage':(context) => HomePage(),
        '/resetPage':(context) => ResetScreen(),
        },
      );
  }
}

class AuthenticationWrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    if (firebaseUser != null && firebaseUser.emailVerified) {
      return HomePage();
    }
    return LoginPage(auth: _auth,);

  }

}

signout(BuildContext context){
  _auth.signOut();
  Navigator.pushReplacementNamed(context, '/loginPage');
}
