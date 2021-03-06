import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  final void Function(String email, String password, String username, bool isLogin, BuildContext ctx) submitFn;

  AuthForm(this.submitFn);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {

  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  String _userEmail = "";
  String _userName = "";
  String _userPassword = "";

  void _trySubmit(){
    final isValid = _formKey.currentState?.validate();
    FocusScope.of(context).unfocus(); //to remove soft keyboard after submit

    if (isValid!){
      _formKey.currentState!.save();
      widget.submitFn(_userEmail.trim(), _userPassword.trim(), _userName.trim(), _isLogin, context);
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
                  key: ValueKey("email"),
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
                if (!_isLogin)
                TextFormField(
                  key: ValueKey("username"),
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
                  key: ValueKey("password"),
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
                ElevatedButton(onPressed: _trySubmit, child: Text(_isLogin ? "Login" : "SignUp")),
                TextButton(onPressed: (){
                  setState((){
                    _isLogin = !_isLogin;
                  });
                }, child: Text(_isLogin ? "Create New Account" : "I already have an account"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
