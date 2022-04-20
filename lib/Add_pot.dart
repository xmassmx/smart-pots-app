import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp_app1/utils/authentication.dart';
import 'package:fyp_app1/main.dart';

import 'first.dart';


class Add_pot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: const Text('Add pot page'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
            Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => first()),
          );
        },
        child: const Icon(Icons.arrow_back),
        tooltip: 'Back',
      ),
    );
  }
}