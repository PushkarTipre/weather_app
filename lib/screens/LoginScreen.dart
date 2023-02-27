import 'package:flutter/material.dart';
import '../Components/textfield.dart';
import '../constants.dart' as constant;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled/Network/Location.dart';

import 'MainScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String email, password;
  int myvar = 0;

  @override
  void initState() {
    super.initState();
    apiCall();
  }

  void apiCall() async {
    var location = await determinePosition();
    myvar = await constant.apiInstance.getLocation(
        location.latitude.toString(), location.longitude.toString());
  }

  @override
  final _auth = FirebaseAuth.instance;
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.network(
                  'https://lionsgate.brightspotcdn.com/59/e8/576c91ae47e4aa7fd6240dc48674/john-wick-chapter-1-movies-poster-01.jpg'),
            ),
            textfield(
              text: 'Email',
              isPassword: false,
              onChanged: (value) {
                email = value;
              },
            ),
            textfield(
              text: 'Password',
              isPassword: true,
              onChanged: (value) {
                password = value;
              },
            ),

            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                width: 180.0,
                color: constant.txtColor,
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1.0,
                        color: constant.txtColor,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  onPressed: () async {
                    try {
                      final newUser = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);

                      if (newUser.user != null && myvar != 0) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainScreen()));
                      }
                    } catch (a) {
                      debugPrint('$a');
                    }
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 30.0, color: constant.backColor),
                  ),
                ),
              ),
            ),
            //OutlinedButton(onPressed: (){}, child: Text('Hello'),)
            Expanded(child: Container()),
          ],
        ),
      ),
      backgroundColor: constant.backColor,
    );
  }
}
