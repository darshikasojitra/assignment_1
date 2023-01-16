import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_assignment_1/dashboard_screen.dart';
import 'package:flutter_assignment_1/signup_screen.dart';

class Login_screen extends StatefulWidget {
  const Login_screen({super.key});

  @override
  State<Login_screen> createState() => _Login_screenState();
}

class _Login_screenState extends State<Login_screen> {
  String email = '';
  String password = '';
  final fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Login',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              child: Form(
                key: fromKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter Email',
                        border: OutlineInputBorder(),
                      ),
                      validator: (email) {
                        return email != null && !EmailValidator.validate(email)
                            ? 'Enter valid Email'
                            : null;
                        //return email!.isEmpty ? 'please enter Email' : null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter Password',
                        border: OutlineInputBorder(),
                      ),
                      /*validator: (password) {
                        //return password!.isEmpty ? 'please enter password' : null;
                        return password != null && password.length < 8
                            ? 'enter password atleast 8 character'
                            : null;
                      },*/
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                        MaterialButton(
                          height: 50,
                          minWidth: 200,
                          onPressed: () {
                            final isValidForm =
                                fromKey.currentState!.validate();

                            if (isValidForm) {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          dashboard_screen()));
                            }
                          },
                          child: const Text('Login',
                          style:  TextStyle(color: Colors.white,
                          fontSize: 20),),
                          color: Colors.blue,
                        ),
                        const SizedBox(
                          height: 20,
              
                        ),
                        MaterialButton(
                          height: 50,
                          minWidth: 200,
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => signup_screen()));
                          },
                          child:  Text('Sign up For New User',
                          style:  TextStyle(color: Colors.white,
                          fontSize: 20),),
                          color: Colors.blue,
                        ),
                        
                      ],
                    ),
                  
                ),
              ),
          ]
        ),
      ),
    );
  }
}
