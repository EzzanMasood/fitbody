import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FetchData extends StatefulWidget {
  const FetchData({super.key});

  @override
  State<FetchData> createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {
  late SharedPreferences preferences;

  @override
  void initState() {
    super.initState();
    // preferences= SharedPreferences.getInstance();
    initSharedPreferences();
  }

  // Initialize SharedPreferences
  Future<void> initSharedPreferences() async {
    preferences = await SharedPreferences.getInstance();
    setState(() {}); // Rebuild widget after initializing SharedPreferences
  }

  // Function to store data in SharedPreferences
  Future<void> setPref(String key, String value) async {
    await preferences.setString(key, value);
  }

  // Function to retrieve data from SharedPreferences
  String getPref(String key) {
    return preferences.getString(key) ?? "No Data";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetch Data'),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Users').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          } else {
            var users = snapshot.data!.docs;
            return ListView.separated(
              itemCount: users.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                var name = users[index]["name"];

                // Store name in SharedPreferences
                setPref("name", name);

                // Retrieve stored name
                var storedName = getPref("name");

                return ListTile(
                  title: Text(storedName),
                );
              },
            );
          }
        },
      ),
    );
  }
}
