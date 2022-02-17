import 'package:flutter/material.dart';
import 'package:flutterd/screens/login_screens.dart';
import 'package:flutterd/state/user_state.dart';
import 'package:flutterd/widgets/custom_button.dart';
import 'package:flutterd/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class RegisterScreens extends StatefulWidget {
  static const routeName = '/register-screens';
  @override
  _RegisterScreensState createState() => _RegisterScreensState();
}

class _RegisterScreensState extends State<RegisterScreens> {
  final _form = GlobalKey<FormState>();

  String _username = '';
  String _password = '';
  String _confpassword = '';

  _registerNow() async {
    var isvalid = _form.currentState.validate();
    if (!isvalid) {
      return;
    }
    _form.currentState.save();
    bool isregis = await Provider.of<UserState>(
      context,
      listen: false,
    ).registernow(_username, _password);
    if (isregis) {
      Navigator.of(context).pushReplacementNamed(LoginScrrens.routeName);
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Something is wrong.Try Again"),
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Enregistrer"),
          backgroundColor: Colors.white,
        elevation: 0.0,
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context)
                            .pushReplacementNamed(LoginScrrens.routeName);
           
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          right: 20,
          left: 20,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _form,
            child: Column(
              children: [
              CustomText(
                text: "Sign Up,",
                fontSize: 30,
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
                height: 30,
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
                  onChanged: (v) {
                    setState(() {
                      _confpassword = v;
                    });
                  },
                  onSaved: (v) {
                    _password = v;
                  },
                  obscureText: true,
                  autocorrect: false,
                  enableSuggestions: false,
                ),
                   SizedBox(
                height: 30,
              ),
                TextFormField(
                  validator: (v) {
                    if (_confpassword != v) {
                      return 'Confirm password';
                    }
                    if (v.isEmpty) {
                      return 'Confirm Your password';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Confirm Password",
                  ),
                  onSaved: (v) {
                    _password = v;
                  },
                  obscureText: true,
                  autocorrect: false,
                  enableSuggestions: false,
                ),
                     SizedBox(
                height: 20,
              ),
              CustomButton(
                onPress: () {
                   _registerNow();
                },
                text: 'Engistrer',
              ),
              SizedBox(
                height: 40,
              ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // RaisedButton(
                    //   onPressed: () {
                    //     _registerNow();
                    //   },
                    //   child: Text("Register"),
                    // ),
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(LoginScrrens.routeName);
                      },
                      child: Text(
                        "Login New",
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
