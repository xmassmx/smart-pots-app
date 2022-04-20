import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp_app1/Add_pot.dart';
import 'package:fyp_app1/pot_info.dart';
import 'package:fyp_app1/utils/authentication.dart';
import 'package:fyp_app1/main.dart';


class first extends StatelessWidget {
  final db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  get user => _auth.currentUser;
  static var doc_id = '';
  static var plant_name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
        title: const Text ('Smart Pots'),
        centerTitle: false,
        elevation: 2,
      ),

      body: Column(
        children: <Widget> [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
                  stream: db.collection("Users").doc(user.uid).collection("Pots").snapshots(),
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return const Text("Error in snapshot");
                    }
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      final list = snapshot.data?.docs;
                      return ListView.builder(

                        itemBuilder: (context, index){

                          return ListTile(

                            title: Text(list![index].id),
                            subtitle: Text(list![index]["Name"]),
                            onTap: () {
                              doc_id = list![index].id;
                              plant_name = list![index]["Name"];
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => pot_info(),
                                ),
                              );
                            },
                          );
                        },
                        itemCount: list?.length,
                      );
                    }
                  },
                ),
            ),
          Row(
            textDirection: TextDirection.ltr,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget> [

              SizedBox(width: MediaQuery.of(context).size.width/70,),
                FloatingActionButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Add_pot()),
                    );
                  },
                  child: const Icon(Icons.add),
                  tooltip: 'Logout',
                ),
                SizedBox(width: MediaQuery.of(context).size.width/70,),
                FloatingActionButton(
                    onPressed: () {
                    AuthenticationHelper()
                        .signOut()
                        .then((_) => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                    ));
                    },
                    child: const Icon(Icons.logout),
                    tooltip: 'Logout',
                    ),
            ]
          ),
          SizedBox(height: MediaQuery.of(context).size.height/70,)
        ],
      ),
      );
  }
}


//
// floatingActionButton: FloatingActionButton(
// onPressed: () {
// AuthenticationHelper()
//     .signOut()
//     .then((_) => Navigator.pushReplacement(
// context,
// MaterialPageRoute(builder: (context) => MyHomePage()),
// ));
// },
// child: const Icon(Icons.logout),
// tooltip: 'Logout',
// ),