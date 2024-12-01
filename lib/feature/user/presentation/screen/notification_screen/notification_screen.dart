import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stray_dog_adoption/data/constant/app_collection.dart';
import 'package:stray_dog_adoption/feature/common/data/model/notification/notification.dart'
    as n;

@RoutePage()
class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notificaiton'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection(AppCollection.notification)
            .where('userId', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final list = [...?snapshot.data?.docs].map((e) {
              return n.Notification.fromJson(e.data());
            }).toList();
            if (list.isEmpty) {
              return const Center(child: Text('No notification'));
            } else {
              return ListView.separated(
                itemCount: list.length,
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemBuilder: (context, index) {
                  final data = list[index];
                  // ignore: lines_longer_than_80_chars
                  final organizationDec =
                      data.adoptionRequest?.organizationDecision;
                  final doctorDec = data.doctorRequest?.doctorDecision;
                  var title = '';
                  var message = '';
                  var icon = Icons.notifications;
                  var color = Colors.black;
                  if (organizationDec?.status == AppDecision.approved) {
                    title = 'Adoption Request Accepted';
                    message =
                        'Adoption Message: ${organizationDec?.reason ?? ''}';
                    icon = Icons.pets;
                    color = Colors.green;
                  } else if (organizationDec?.status == AppDecision.rejected) {
                    title = 'Adoption Request Rejected';
                    message =
                        'Adoption Message: ${organizationDec?.reason ?? ''}';
                    icon = Icons.pets;
                    color = Colors.red;
                  } else if (doctorDec?.status == AppDecision.approved) {
                    title = 'Doctor Request Accepted';
                    message = 'Doctor Message: ${doctorDec?.reason ?? ''}';
                    icon = Icons.local_hospital;
                    color = Colors.green;
                  } else if (doctorDec?.status == AppDecision.rejected) {
                    title = 'Doctor Request Rejected';
                    message = 'Doctor Message: ${doctorDec?.reason ?? ''}';
                    icon = Icons.local_hospital;
                    color = Colors.red;
                  }
                  return ListTile(
                    leading: Icon(icon, color: color),
                    title: Text(title),
                    subtitle: Text(message),
                    trailing: !data.seen
                        ? IconButton(
                            icon: const Icon(Icons.visibility_outlined),
                            onPressed: () {
                              [...?snapshot.data?.docs][index]
                                  .reference
                                  .update({
                                'seen': true,
                              });
                            },
                          )
                        : const SizedBox.shrink(),
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
