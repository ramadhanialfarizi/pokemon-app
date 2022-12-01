import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SideBarWidget extends StatelessWidget {
  const SideBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          userAccount(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: button(context),
          ),
        ],
      ),
    );
  }

  Widget userAccount() {
    return UserAccountsDrawerHeader(
      accountName: Text(
        'Rama',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      accountEmail: Text(
        'ramadhani@gmail.com',
        style: TextStyle(
          fontSize: 11,
          color: Colors.white,
        ),
      ),
      currentAccountPicture: Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: CircleAvatar(
          child: ClipOval(),
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.orange[700],
      ),
    );
  }

  Widget button(context) {
    return SizedBox(
      width: double.infinity,
      height: 55.0,
      child: ElevatedButton(
        onPressed: () {
          //Navigator.of(context).pushNamed('/cover');
          GoogleSignIn().signOut();
          FirebaseAuth.instance.signOut();
          Navigator.of(context).pushReplacementNamed('/login');
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
        ),
        child: Text(
          'logout',
          style: TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}
