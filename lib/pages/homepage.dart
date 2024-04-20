import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterxfirebase/pages/renewal.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  Object? userData;

  final docRef = FirebaseFirestore.instance.collection('users');

  Future<void> getUserData() async {
    try {
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: user.email)
          .get();

      if (snapshot.docs.isNotEmpty) {
        userData = snapshot.docs.first.data();
        debugPrint('User data: $userData');
      } else {
        debugPrint('No user found with email:');
      }
    } catch (error) {
      debugPrint('Error retrieving user data: $error');
    }
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.greenAccent[300],
        appBar: AppBar(
          title: const Text('UNIAccess'),
          centerTitle: true,
          backgroundColor: Colors.greenAccent,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Colors.greenAccent,
                  ),
                  child: Text(
                      // Concatenate first name and last name
                      '${(userData as Map<String, dynamic>)['first name']} ${(userData as Map<String, dynamic>)['last name']}')),
              ListTile(
                title: const Text('Renew ID'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Renewal()),
                  );
                },
              ),
              ListTile(
                title: const Text('Log Out'),
                onTap: () {
                  FirebaseAuth.instance.signOut();
                },
              ),
            ],
          ),
        ),
        // body: SingleChildScrollView(
        //   child: Column(
        //     children: [
        //       Header(
        //         university: studentDetailsMap['university'],
        //         logo: studentDetailsMap['logo'],
        //       ),
        //       StudentForm(
        //         name: studentDetailsMap['name'],
        //         department: studentDetailsMap['department'],
        //         id: studentDetailsMap['id'],
        //         propic: studentDetailsMap['propic'],
        //       ),
        //       // const StuBarCode(),
        //     ],
        //   ),
        // ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => EditProfilePage(),
        //       ),
        //     );
        //   },
        //   backgroundColor: Colors.greenAccent,
        //   child: const Icon(Icons.edit),
        // ),
      ),
    );
  }
}
