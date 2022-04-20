import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fyp_app1/utils/authentication.dart';
import 'package:fyp_app1/main.dart';

import 'first.dart';


class pot_info extends StatefulWidget {
  const pot_info({ Key? key }) : super(key: key);

  @override
  State<pot_info> createState() => _pot_info_State();
}

class _pot_info_State extends State<pot_info> {
  final plant_id = first.doc_id;
  final plant = first.plant_name;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  get usr_id => _auth.currentUser?.uid;
  final _rtdbRef = FirebaseDatabase.instance.ref();
  String _displayText_hum = 'Humidity results';
  String _displayText_temp = 'Temp results';
  late StreamSubscription _Hum_stream;
  late StreamSubscription _Temp_stream;
  @override


  void initState(){
    super.initState();
    _get_hum();
    _get_temp();

  }
  void _get_hum(){
    _Hum_stream = _rtdbRef.child('user/$usr_id/$plant_id/Hum/Hum_live').onValue.listen((event) {
      final Hum_live = event.snapshot.value.toString();
      setState(() {
        _displayText_hum = 'Hum: $Hum_live';
      });
    });
  }
  void _get_temp(){
    _Temp_stream = _rtdbRef.child('user/$usr_id/$plant_id/Temp/Temp_live').onValue.listen((event) {
      final Temp_live = event.snapshot.value.toString();
      setState(() {
        _displayText_temp = 'Temp: $Temp_live';
      });
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            children: <Widget> [
              SizedBox(height: MediaQuery.of(context).size.height/10,),
              const Text("Real time page"),
              SizedBox(height: MediaQuery.of(context).size.height/10,),
              Text(usr_id),
              SizedBox(height: MediaQuery.of(context).size.height/10,),
              Text(plant_id),
              SizedBox(height: MediaQuery.of(context).size.height/10,),
              Text(plant),
              SizedBox(height: MediaQuery.of(context).size.height/10,),
              Text(_displayText_hum),
              SizedBox(height: MediaQuery.of(context).size.height/10,),
              Text(_displayText_temp),
              SizedBox(height: MediaQuery.of(context).size.height/10,)
            ]
        )
    );
  }

  @override
  void deactivate(){
    _Temp_stream.cancel();
    _Hum_stream.cancel();
    super.deactivate();
  }
}



// Center(
// child: Container(
// child: Text(first.doc_id),
// ),
// ),
// floatingActionButton: FloatingActionButton(
// onPressed: () {
// Navigator.pushReplacement(
// context,
// MaterialPageRoute(builder: (context) => first()),
// );
// },
// child: const Icon(Icons.arrow_back),
// tooltip: 'Back',
// ),


