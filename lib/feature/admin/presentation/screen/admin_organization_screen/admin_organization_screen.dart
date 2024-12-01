import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stray_dog_adoption/core/router/app_router.gr.dart';
import 'package:stray_dog_adoption/data/constant/app_collection.dart';
import 'package:stray_dog_adoption/data/constant/user_type.dart';
import 'package:stray_dog_adoption/feature/common/data/model/user/user.dart';
import 'package:stray_dog_adoption/feature/common/presentation/widget/doctor_grid_tile/doctor_grid_tile.dart';
import 'package:stray_dog_adoption/main.dart';

@RoutePage()
class AdminOrganizationScreen extends StatelessWidget {
  const AdminOrganizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final stream = FirebaseFirestore.instance
        .collection(AppCollection.user)
        .where(
          'type',
          isEqualTo: UserType.organization,
        )
        .snapshots();
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final list = [...?snapshot.data?.docs]
              .map((e) {
                return UserDetail.fromJson(e.data());
              })
              .where(
                (e) => e.userDetailId != FirebaseAuth.instance.currentUser?.uid,
              )
              .toList();
          if (list.isEmpty) {
            return const Center(child: Text('No organization'));
          } else {
            return GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              children: List.generate(
                list.length,
                (index) {
                  final user = list[index];
                  return DoctorGridTile(
                    userDetail: user,
                    onTap: () {
                      appRouter.push(AddOrganizationRoute(userDetail: user));
                    },
                    onRequest: () {},
                  );
                },
              ),
            );
          }
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
