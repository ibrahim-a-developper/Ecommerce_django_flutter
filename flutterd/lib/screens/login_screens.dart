import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutterd/constance.dart';
import 'package:flutterd/screens/home_Screens.dart';
import 'package:flutterd/screens/register_screens.dart';
import 'package:flutterd/state/user_state.dart';
import 'package:flutterd/widgets/custom_button_social.dart';
import 'package:flutterd/widgets/custom_text.dart';
import 'package:provider/provider.dart';
import 'package:flutterd/widgets/custom_button.dart';
import 'package:flutterd/widgets/custom_text_form_field.dart';

class LoginScrrens extends StatefulWidget {
  static const routeName = '/login-screens';

  @override
  _LoginScrrensState createState() => _LoginScrrensState();
}

class _LoginScrrensState extends State<LoginScrrens> {
  String _username = '';
  String _password = '';
  final _form = GlobalKey<FormState>();

  void _loginNew() async {
    var isvalid = _form.currentState.validate();
    if (!isvalid) {
      return;
    }
    _form.currentState.save();
    bool istoken = await Provider.of<UserState>(
      context,
      listen: false,
    ).loginNow(_username, _password);
    if (istoken) {
      Navigator.of(context).pushReplacementNamed(HomeScreens.routeName);
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Login ou mot de passe invalide"),
              actions: [
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                )
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          "Login",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
          right: 20,
          left: 20,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _form,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text: "Bienvenue", fontSize: 30),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacementNamed(RegisterScreens.routeName);
                      },
                      child: CustomText(
                        text: "Enregistere",
                        color: primaryColor,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                CustomText(
                  text: "Sign in to continue",
                  color: Colors.grey,
                  fontSize: 14,
                ),
                SizedBox(
                  height: 30,
                ),
                   TextFormField(
                  validator: (v) {
                    if (v.isEmpty) {
                      return 'Enter Your Username';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Username",
                  ),
                  onSaved: (v) {
                    _username = v;
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                TextFormField(
                  validator: (v) {
                    if (v.isEmpty) {
                      return 'Enter Your password';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Password",
                  ),
                  onSaved: (v) {
                    _password = v;
                  },
                  obscureText: true,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomText(
                  text: 'Password oublier ?',
                  fontSize: 14,
                  alignment: Alignment.topRight,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                  onPress: () {
                     _loginNew();
                  },
                  text: "Connecter vous",
                ),
                SizedBox(
                  height: 20,
                ),
                CustomText(
                  text: '-OR-',
                  alignment: Alignment.center,
                ),
                SizedBox(
                  height: 30,
                ),
                CustomButtonSocial(
                  text: 'Sign in with facebook',
                  imageName: 'assets/images/facebook.png',
                  onPress: () {
                    print("ll");
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                CustomButtonSocial(
                  text: 'Sign in with google',
                  onPress: () {
                    print("google");
                  },
                  imageName: 'assets/images/google.png',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
