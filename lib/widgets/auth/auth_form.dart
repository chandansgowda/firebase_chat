import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {

  final _formKey = GlobalKey<FormState>();
  String _userEmail = "";
  String _userName = "";
  String _userPassword = "";

  void _trySubmit(){
    final isValid = _formKey.currentState?.validate();
    FocusScope.of(context).unfocus(); //to remove soft keyboard after submit

    if (isValid!){
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  validator: (value){
                    if (value!.isEmpty || !value.contains("@")){
                      return "Please Enter a valid email address";
                    }
                    else return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email Address",
                  ),
                  onSaved: (value){
                    _userEmail = value!;
                  },
                ),
                TextFormField(
                  validator: (value){
                    if (value!.isEmpty || value.length <4){
                      return "Please enter at least 4 characters";
                    }
                    else return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Username"
                  ),
                  onSaved: (value){
                    _userName = value!;
                  },
                ),
                TextFormField(
                  validator: (value){
                    if (value!.isEmpty || value.length<7){
                      return "Password must be at least 7 characters long";
                    }
                    else return null;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                  ),
                  onSaved: (value){
                    _userPassword = value!;
                  },
                ),
                SizedBox(height: 12,),
                ElevatedButton(onPressed: _trySubmit, child: Text("Login")),
                TextButton(onPressed: (){}, child: Text("Create New Account"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
