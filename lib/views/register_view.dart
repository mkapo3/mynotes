import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

import 'package:mynotes/constants/routes.dart';
import 'package:mynotes/services/auth/auth_exceptions.dart';
import 'package:mynotes/utilities/dialogs/error_dialog.dart';

import '../services/auth/auth_service.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({ Key? key }) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState(){
    _email = TextEditingController();
    _password = TextEditingController();
  }

  @override
  void dispose(){
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text ('Register'),
      ),
      body: Column(
              children: [
                TextField(
                  controller: _email,
                  enableSuggestions: false,
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: 'Enter your email here',
                  ),
                ),
                TextField(
                  controller: _password,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: const InputDecoration(
                    hintText: 'Enter your password here',
                  ),
                ),
                TextButton(
                          onPressed: () async {
                            
                            final email = _email.text;
                            final password = _password.text;
                            try{
                              final userCredential = await AuthService.firebase().createUser(
                                email: email,
                                password: password
                              );
                              final user = AuthService.firebase().currentUser;
                              await AuthService.firebase().sendEmailVerification();
                              Navigator.of(context).pushNamed(
                                verifyEmailRoute, 
                              );
                              //devtools.log(userCredential.toString());
                            }
                            on WeakPasswordAuthException{
                              await showErrorDialog(context, 'Weak password');
                            }
                            on EmailAlreadyInUseAuthException{
                              await showErrorDialog(context, 'Email already in use');                            
                            }
                            on InvalidEmailAuthException{
                              await showErrorDialog(context, 'Invalid email');                  
                            }
                            on GenericAuthExcpetion{
                              await showErrorDialog(context, 'Registration error');
                            }
  
                          }, 
                          child: const Text('Register'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              loginRoute,
                              (route) => false
                            );
                          },
                          child: const Text('Go to login view'),
                        )
              ],
            ),
    );
  }
}