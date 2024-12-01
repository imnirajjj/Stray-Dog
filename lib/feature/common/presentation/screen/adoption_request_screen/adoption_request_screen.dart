import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stray_dog_adoption/core/di/injection.dart';
import 'package:stray_dog_adoption/core/router/app_router.gr.dart';
import 'package:stray_dog_adoption/data/constant/app_collection.dart';
import 'package:stray_dog_adoption/data/constant/app_key.dart';
import 'package:stray_dog_adoption/data/constant/user_type.dart';
import 'package:stray_dog_adoption/feature/common/data/model/adoption_request/adoption_request.dart';
import 'package:stray_dog_adoption/main.dart';

@RoutePage()
class AdoptionRequestScreen extends StatelessWidget {
  const AdoptionRequestScreen({
    this.isForUser = false,
    super.key,
  });
  final bool isForUser;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final userType = getIt<SharedPreferences>().getString(AppKey.userType);
    Stream<QuerySnapshot<Map<String, dynamic>>>? stream;
    if (userType == UserType.admin) {
      stream = FirebaseFirestore.instance
          .collection(AppCollection.adoption)
          .snapshots();
    } else if (isForUser) {
      stream = FirebaseFirestore.instance
          .collection(AppCollection.adoption)
          .where('userId', isEqualTo: user?.uid ?? '')
          .snapshots();
    } else {
      stream = FirebaseFirestore.instance
          .collection(AppCollection.adoption)
          .where('ownerUserId', isEqualTo: user?.uid ?? '')
          .snapshots();
    }
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final list = [...?snapshot.data?.docs].map((e) {
            return AdoptionRequest.fromJson(e.data());
          }).toList();
          if (list.isEmpty) {
            return const Center(child: Text('No request'));
          } else {
            return ListView(
              children: List.generate(
                list.length,
                (index) {
                  final adoption = list[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ListTile(
                        dense: true,
                        title: Text('Request #${adoption.requestUserEmail}'),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                appRouter.push(
                                  AdoptionDetailRoute(
                                    adoptionId: adoption.adoptionId,
                                  ),
                                );
                              },
                              child: const Text('View Request'),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                    ],
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
