import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stray_dog_adoption/data/constant/app_collection.dart';
import 'package:stray_dog_adoption/feature/common/data/model/user/user.dart';

class UserSelectorScreen extends StatefulWidget {
  const UserSelectorScreen({super.key});

  @override
  State<UserSelectorScreen> createState() => _UserSelectorScreenState();
}

class _UserSelectorScreenState extends State<UserSelectorScreen> {
  final selfUid = FirebaseAuth.instance.currentUser?.uid;
  List<UserDetail>? users;

  Future<void> getData() async {
    users = (await FirebaseFirestore.instance
            .collection(
              AppCollection.user,
            )
            .where('userDetailId', isNotEqualTo: selfUid)
            .get())
        .docs
        .map((e) => UserDetail.fromJson(e.data()))
        .toList();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Column(
        children: [
          const ListTile(title: Text('Select User')),
          const Divider(),
          Expanded(
            child: users == null
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                    children: [...?users].map((e) {
                      return ListTile(
                        onTap: () {
                          Navigator.of(context).pop(e);
                        },
                        title: Text(e.name),
                        subtitle: Text(e.email),
                      );
                    }).toList(),
                  ),
          ),
        ],
      ),
    );
  }
}
