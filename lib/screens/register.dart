// ignore_for_file: constant_identifier_names, use_build_context_synchronously
import 'dart:convert';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:weaponry/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);
  static const ROUTE_NAME = '/register';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  String username = "";
  String password1 = "";
  String password2 = "";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    Size size = MediaQuery.of(context).size;
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Color.fromARGB(255, 4, 118, 40),
              Color.fromARGB(255, 187, 211, 68)
            ])),
        child: Form(
          key: _formKey,
          child: Stack(
            children: [
              Scaffold(
                backgroundColor: Colors.white,
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.width * 0.1,
                      ),
                      Stack(
                        children: const [
                          Center(
                            child: Text('Register',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 55,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.width * 0.1,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25.0, vertical: 10.0),
                            child: TextFormField(
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                hintText: "contoh: Dummy123",
                                labelText: "Username",
                                labelStyle:
                                    const TextStyle(color: Colors.black),
                                icon: const Icon(Icons.people),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                                hintStyle: const TextStyle(color: Colors.black),
                              ),
                              onChanged: (String? value) {
                                setState(() {
                                  username = value!;
                                });
                              },
                              onSaved: (String? value) {
                                setState(() {
                                  username = value!;
                                });
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Username tidak boleh kosong';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25.0, vertical: 10.0),
                            child: TextFormField(
                              obscureText: true,
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                hintText: "Masukkan Password",
                                labelText: "Password",
                                labelStyle:
                                    const TextStyle(color: Colors.black),
                                icon: const Icon(
                                  Icons.lock_outline,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                                hintStyle: const TextStyle(color: Colors.black),
                              ),
                              onChanged: (String? value) {
                                setState(() {
                                  password1 = value!;
                                });
                              },
                              onSaved: (String? value) {
                                setState(() {
                                  password1 = value!;
                                });
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Password tidak boleh kosong';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25.0, vertical: 10.0),
                            child: TextFormField(
                              obscureText: true,
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                hintText: "Konfirmasi Password",
                                labelText: "Konfirmasi Password",
                                labelStyle:
                                    const TextStyle(color: Colors.black),
                                icon: const Icon(Icons.lock_outline),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                                hintStyle: const TextStyle(color: Colors.black),
                              ),
                              onChanged: (String? value) {
                                setState(() {
                                  password2 = value!;
                                });
                              },
                              onSaved: (String? value) {
                                setState(() {
                                  password2 = value!;
                                });
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Password tidak boleh kosong';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Container(
                            height: size.height * 0.08,
                            width: size.width * 0.8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.green,
                            ),
                            child: TextButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  // Submit to Django server and wait for response
                                  final response = await request.postJson(
                                      "https://naufal-ichsan-tugas.pbp.cs.ui.ac.id/auth/register/",
                                      jsonEncode(<String, String>{
                                        'username': username,
                                        'password1': password1,
                                        'password2': password2,
                                      }));
                                  if (response['status'] == 'success') {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text(
                                          "Register Berhasil"),
                                    ));
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginPage()),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text(
                                          "Register Gagal, coba lagi!"),
                                    ));
                                  }
                                }
                              },
                              child: const Text(
                                'Register',
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Already have an account?',
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.black,
                                    height: 1.5),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Route menu ke counter
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginPage()),
                                  );
                                },
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}