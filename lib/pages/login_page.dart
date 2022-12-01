import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 250),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/splashscreen.png',
                    scale: 5,
                  ),
                  SizedBox(
                    height: 19,
                  ),
                  const Text(
                    'Welcome to Pokemon app',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        // ADD LOGIN WITH GOOGLE CHECK
                        if (FirebaseAuth.instance.currentUser == null) {
                          GoogleSignInAccount? account =
                              await GoogleSignIn().signIn();

                          if (account != null) {
                            GoogleSignInAuthentication auth =
                                await account.authentication;
                            OAuthCredential credential =
                                GoogleAuthProvider.credential(
                              accessToken: auth.accessToken,
                              idToken: auth.idToken,
                            );
                            await FirebaseAuth.instance
                                .signInWithCredential(credential);
                            //Navigator.of(context).pushReplacementNamed('/home');
                          }
                        }
                        Navigator.of(context).pushReplacementNamed('/home');
                      },
                      icon: const Icon(Icons.account_circle_outlined, size: 30),
                      label: const Text(
                        ' Login with your Google account',
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 100, 220, 104)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
