import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stray_dog_adoption/core/router/app_router.gr.dart';
import 'package:stray_dog_adoption/data/constant/app_collection.dart';
import 'package:stray_dog_adoption/feature/common/data/model/adoption_request/adoption_request.dart';
import 'package:stray_dog_adoption/main.dart';

@RoutePage()
class DoctorRequestScreen extends StatelessWidget {
  const DoctorRequestScreen({
    this.isForUser = false,
    super.key,
  });
  final bool isForUser;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    Stream<QuerySnapshot<Map<String, dynamic>>>? stream;
    if (isForUser) {
      stream = FirebaseFirestore.instance
          .collection(AppCollection.doctor)
          .where('requestUserId', isEqualTo: user?.uid ?? '')
          .snapshots();
    } else {
      stream = FirebaseFirestore.instance
          .collection(AppCollection.doctor)
          .where('doctorId', isEqualTo: user?.uid ?? '')
          .snapshots();
    }
    return Scaffold(
      appBar: AppBar(title: const Text('Doctor Request')),
      body: StreamBuilder(
        stream: stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final list = [...?snapshot.data?.docs].map((e) {
              return DoctorRequest.fromJson(e.data());
            }).toList();
            if (list.isEmpty) {
              return const Center(child: Text('No request'));
            } else {
              return ListView(
                children: List.generate(
                  list.length,
                  (index) {
                    final doctor = list[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ListTile(
                          dense: true,
                          title: Text('Request #${doctor.requestUserEmail}'),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  appRouter.push(
                                    DoctorRequestDetailRoute(
                                      doctorRequestId: doctor.doctorRequestId,
                                      isForUser: isForUser,
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
      ),
    );
  }
}
