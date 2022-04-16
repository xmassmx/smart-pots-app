import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyp_app1/utils/authentication.dart';
import 'package:firebase_core/firebase_core.dart';

import 'first.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Pots',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  //final _formKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late bool passwordVisibility;
  late TextEditingController emailSignupController;
  late TextEditingController nameController;
  late TextEditingController passwordsignupController;
  late bool passwordsignupVisibility;
  late TextEditingController passworConfirmController;
  late bool passworConfirmVisibility;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late bool _success;
  //final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;
    emailSignupController = TextEditingController();
    nameController = TextEditingController();
    passwordsignupController = TextEditingController();
    passwordsignupVisibility = false;
    passworConfirmController = TextEditingController();
    passworConfirmVisibility = false;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
        title: const Text ('Login Page'),
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                    child: DefaultTabController(
                      length: 2,
                      initialIndex: 0,
                      child: Column(
                          children: [
                            const TabBar(
                              labelColor: Colors.white,
                              indicatorColor: Colors.lightGreenAccent,
                              tabs: [
                                Tab(
                                  text: 'Sign In',
                                ),
                                Tab(
                                  text: 'Sign Up',
                                ),
                              ],
                            ),
                            Expanded(
                              child: TabBarView(
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        SizedBox(height: MediaQuery.of(context).size.height/20,),
                                        Container (
                                          width: MediaQuery.of(context).size.width/1.1,
                                          child: TextFormField(
                                            controller: emailController,
                                            obscureText: false,
                                            decoration: const InputDecoration(
                                              hintText: 'Email',
                                              enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.black,
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10.0),
                                                  topRight: Radius.circular(10.0),
                                                  bottomLeft: Radius.circular(10.0),
                                                  bottomRight: Radius.circular(10.0),
                                                ),
                                              ),
                                              focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.black,
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10.0),
                                                  topRight: Radius.circular(10.0),
                                                  bottomLeft: Radius.circular(10.0),
                                                  bottomRight: Radius.circular(10.0),
                                                ),
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: MediaQuery.of(context).size.height/35,),
                                        Container (
                                          width: MediaQuery.of(context).size.width/1.1,
                                          child: TextFormField(
                                          controller: passwordController,
                                          obscureText: !passwordVisibility,

                                          decoration: InputDecoration(
                                            hintText: 'Password',
                                            enabledBorder: const UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.black,
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10.0),
                                                topRight: Radius.circular(10.0),
                                                bottomLeft: Radius.circular(10.0),
                                                bottomRight: Radius.circular(10.0),
                                              ),
                                            ),
                                            focusedBorder: const UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.black,
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10.0),
                                                topRight: Radius.circular(10.0),
                                                bottomLeft: Radius.circular(10.0),
                                                bottomRight: Radius.circular(10.0),
                                              ),
                                            ),
                                            suffixIcon: InkWell(
                                              onTap: () =>
                                                  setState(
                                                        () =>
                                                    passwordVisibility =
                                                    !passwordVisibility,
                                                  ),
                                              child: Icon(
                                                passwordVisibility
                                                    ? Icons.visibility_outlined
                                                    : Icons
                                                    .visibility_off_outlined,
                                                color: const Color(0xFF757575),
                                                size: 22,
                                              ),
                                            ),
                                            filled: true,
                                            fillColor: Colors.white,
                                          ),
                                        ),

                                        ),
                                        SizedBox(height: MediaQuery.of(context).size.height/35,),
                                        OutlinedButton(
                                          child: const Text(
                                              'Login',
                                              style: TextStyle(fontSize: 24)
                                          ),
                                          style: OutlinedButton.styleFrom(
                                            primary: Colors.green,
                                            backgroundColor: Colors.white,
                                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                                            elevation: 5,
                                          ),
                                          onPressed: () {
                                            // Respond to button press

                                            // if (_formKey.currentState!
                                            //     .validate()) {
                                            //   _formKey.currentState!.save();

                                              AuthenticationHelper()
                                                  .signIn(
                                                  email: emailController.text,
                                                  password: passwordController.text)
                                                  .then((result) {
                                                if (result == null) {
                                                  Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              first()));
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                        content: Text(
                                                        result,
                                                        style: const TextStyle(
                                                            fontSize: 16),
                                                        ),
                                                      ));
                                                }
                                              });
                                            // }
                                          },
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        SizedBox(height: MediaQuery.of(context).size.height/20,),
                                        Container(
                                          width: MediaQuery.of(context).size.width/1.1,
                                          child: TextFormField(
                                          controller: nameController,
                                          obscureText: false,
                                          decoration: const InputDecoration(
                                            hintText: 'Name',
                                            enabledBorder:UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10.0),
                                                topRight: Radius.circular(10.0),
                                                bottomLeft: Radius.circular(10.0),
                                                bottomRight: Radius.circular(10.0),
                                              ),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10.0),
                                                topRight: Radius.circular(10.0),
                                                bottomLeft: Radius.circular(10.0),
                                                bottomRight: Radius.circular(10.0),
                                              ),
                                            ),
                                            filled: true,
                                            fillColor: Colors.white,
                                          ),
                                        ),
                                        ),
                                        SizedBox(height: MediaQuery.of(context).size.height/35,),
                                        Container(
                                          width: MediaQuery.of(context).size.width/1.1,
                                          child: TextFormField(
                                          controller: emailSignupController,
                                          obscureText: false,
                                          decoration: const InputDecoration(
                                            hintText: 'Email',
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10.0),
                                                topRight: Radius.circular(10.0),
                                                bottomLeft: Radius.circular(10.0),
                                                bottomRight: Radius.circular(10.0),
                                              ),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10.0),
                                                topRight: Radius.circular(10.0),
                                                bottomLeft: Radius.circular(10.0),
                                                bottomRight: Radius.circular(10.0),
                                              ),
                                            ),
                                            filled: true,
                                            fillColor: Colors.white,
                                          ),
                                        ),
                                        ),
                                        SizedBox(height: MediaQuery.of(context).size.height/35,),
                                        Container(
                                          width: MediaQuery.of(context).size.width/1.1,
                                          child: TextFormField(
                                          controller: passwordsignupController,
                                          obscureText: !passwordsignupVisibility,
                                          decoration: InputDecoration(
                                            hintText: 'Password',
                                            enabledBorder: const UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10.0),
                                                topRight: Radius.circular(10.0),
                                                bottomLeft: Radius.circular(10.0),
                                                bottomRight: Radius.circular(10.0),
                                              ),
                                            ),
                                            focusedBorder: const UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10.0),
                                                topRight: Radius.circular(10.0),
                                                bottomLeft: Radius.circular(10.0),
                                                bottomRight: Radius.circular(10.0),
                                              ),
                                            ),
                                            suffixIcon: InkWell(
                                              onTap: () => setState(
                                                    () => passwordsignupVisibility =
                                                !passwordsignupVisibility,
                                              ),
                                              child: Icon(
                                                passwordsignupVisibility
                                                    ? Icons.visibility_outlined
                                                    : Icons.visibility_off_outlined,
                                                color: Color(0xFF757575),
                                                size: 22,
                                              ),
                                            ),
                                            filled: true,
                                            fillColor: Colors.white,
                                          ),
                                        ),
                                        ),
                                        SizedBox(height: MediaQuery.of(context).size.height/35,),
                                        Container(
                                          width: MediaQuery.of(context).size.width/1.1,
                                          child: TextFormField(
                                          cursorColor: Colors.green,
                                          controller: passworConfirmController,
                                          obscureText: !passworConfirmVisibility,
                                          decoration: InputDecoration(
                                            hintText: 'Re-enter Password',
                                            enabledBorder: const UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10.0),
                                                topRight: Radius.circular(10.0),
                                                bottomLeft: Radius.circular(10.0),
                                                bottomRight: Radius.circular(10.0),
                                              ),
                                            ),
                                            focusedBorder: const UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10.0),
                                                topRight: Radius.circular(10.0),
                                                bottomLeft: Radius.circular(10.0),
                                                bottomRight: Radius.circular(10.0),
                                              ),
                                            ),
                                            suffixIcon: InkWell(
                                              onTap: () => setState(
                                                    () => passworConfirmVisibility =
                                                !passworConfirmVisibility,
                                              ),
                                              child: Icon(
                                                passworConfirmVisibility
                                                    ? Icons.visibility_outlined
                                                    : Icons.visibility_off_outlined,
                                                color: Color(0xFF757575),
                                                size: 22,
                                              ),
                                            ),
                                            filled: true,
                                            fillColor: Colors.white,
                                          ),
                                        ),
                                        ),
                                        SizedBox(height: MediaQuery.of(context).size.height/35,),
                                        OutlinedButton(
                                          child: const Text(
                                              'Sign Up',
                                              style: TextStyle(fontSize: 24)
                                          ),
                                          style: OutlinedButton.styleFrom(
                                            primary: Colors.green,
                                            backgroundColor: Colors.white,
                                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                                            elevation: 5,
                                          ),
                                          onPressed: () async {
                                            if (passwordsignupController.text !=
                                                passworConfirmController.text) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                  content: Text(
                                                    'Passwords don\'t match!',
                                                  ),
                                                ),
                                              );
                                              return;
                                            }
                                            // if (_formKey.currentState!.validate()) {
                                            //   _formKey.currentState!.save();

                                              AuthenticationHelper()
                                                  .signUp(
                                                  email: emailSignupController
                                                      .text,
                                                  password: passwordsignupController
                                                      .text)
                                                  .then((result) {
                                                if (result == null) {
                                                  Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              first()));
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                    content: Text(
                                                      result,
                                                      style: const TextStyle(
                                                          fontSize: 16),
                                                    ),

                                                  ));
                                                }
                                              });
                                            AuthenticationHelper()
                                                .addUser(
                                                Name: nameController
                                                    .text);
                                            // }
                                          },
                                        ),

                                      ]
                                    ),
                                  ]
                              ),
                            ),
                          ]
                      ),
                    ),
                  ),
                )
              ]
          ),
        ),
      ),
    );
    }
}

  // ref: https://github.com/dipak2726/flutter_firebase_auth/blob/master/lib/login.dart