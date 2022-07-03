import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_chat/widgets/auth/auth_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;

  void _submitAuthForm(String email, String password, String username, bool isLogin, BuildContext ctx) async{
    //use firebase authentication here
    UserCredential authResult;
    try{
      if (isLogin){
        authResult = await _auth.signInWithEmailAndPassword(email: email, password: password);
      }else{
        authResult = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      }
    } on PlatformException catch (err){
      var message = "An error occured, please check your credentials!";

      if (err.message != null){
        message = err.message!;
      }

      Scaffold.of(context).showSnackBar(SnackBar(content: Text(message), backgroundColor: Theme.of(ctx).errorColor,));

    } catch (err){
      log(err.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AuthForm(_submitAuthForm)
    );
  }
}
