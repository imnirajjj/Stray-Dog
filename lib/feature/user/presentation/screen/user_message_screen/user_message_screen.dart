import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stray_dog_adoption/core/router/app_router.gr.dart';
import 'package:stray_dog_adoption/data/constant/app_collection.dart';
import 'package:stray_dog_adoption/feature/common/data/model/message/message.dart';
import 'package:stray_dog_adoption/main.dart';

@RoutePage()
class UserMessageScreen extends StatefulWidget {
  const UserMessageScreen({super.key});

  @override
  State<UserMessageScreen> createState() => _UserMessageScreenState();
}

class _UserMessageScreenState extends State<UserMessageScreen> {
  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection(AppCollection.conversation)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final list = [...?snapshot.data?.docs]
              .map((e) {
                return Conversation.fromJson(e.data());
              })
              .toList()
              .where((e) => e.senderId == uid || e.receiverId == uid)
              .toList();
          if (list.isEmpty) {
            return const Center(child: Text('No conversation'));
          } else {
            return ListView(
              children: List.generate(
                list.length,
                (index) {
                  final conversation = list[index];
                  String? otherId;
                  var name = '';
                  if (conversation.senderId != uid) {
                    name = conversation.senderName;
                    otherId = conversation.senderId;
                  } else if (conversation.receiverId != uid) {
                    name = conversation.receiveName;
                    otherId = conversation.receiverId;
                  }
                  return ListTile(
                    onTap: () {
                      if (otherId != null) {
                        appRouter.push(MessageDetailRoute(otherId: otherId));
                      }
                    },
                    leading: const Icon(Icons.person_outline),
                    title: Text(name),
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
