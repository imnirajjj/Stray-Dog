import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stray_dog_adoption/data/constant/app_collection.dart';
import 'package:stray_dog_adoption/feature/common/data/model/user/user.dart';

@RoutePage()
class UserListScreen extends StatelessWidget {
  const UserListScreen({
    required this.userType,
    required this.onUserSelected,
    super.key,
  });
  final String userType;
  final void Function(UserDetail) onUserSelected;

  @override
  Widget build(BuildContext context) {
    final stream = FirebaseFirestore.instance
        .collection(AppCollection.user)
        .where('type', isEqualTo: userType)
        .snapshots();
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
      ),
      body: StreamBuilder(
        stream: stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final list = [...?snapshot.data?.docs]
                .map((e) {
                  return UserDetail.fromJson(e.data());
                })
                .where(
                  (e) =>
                      e.userDetailId != FirebaseAuth.instance.currentUser?.uid,
                )
                .toList();
            if (list.isEmpty) {
              return const Center(child: Text('No user'));
            } else {
              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  final user = list[index];
                  return ListTile(
                    onTap: () => onUserSelected(user),
                    title: Text(
                      user.name.trim().isNotEmpty
                          ? user.name
                          : user.userDetailId,
                    ),
                    trailing: Text(
                      user.doctorExperience == null ? 'Add' : 'Update',
                    ),
                  );
                },
              );
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
