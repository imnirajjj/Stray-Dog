import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stray_dog_adoption/data/constant/app_collection.dart';
import 'package:stray_dog_adoption/feature/common/data/model/message/message.dart';
import 'package:stray_dog_adoption/feature/common/data/model/user/user.dart';

@RoutePage()
class MessageDetailScreen extends StatefulWidget {
  const MessageDetailScreen({
    required this.otherId,
    super.key,
  });
  final String otherId;

  @override
  State<MessageDetailScreen> createState() => _MessageDetailScreenState();
}

class _MessageDetailScreenState extends State<MessageDetailScreen> {  
  String? selfId = FirebaseAuth.instance.currentUser?.uid;
  UserDetail? self;
  UserDetail? other;
  Future<void> init() async {
    /// get data
    final userCollection =
        FirebaseFirestore.instance.collection(AppCollection.user);
    final selfRaw = (await userCollection.doc(selfId).get()).data();
    final otherRaw = (await userCollection.doc(widget.otherId).get()).data();
    if (selfRaw != null) {
      self = UserDetail.fromJson(selfRaw);
    }
    if (otherRaw != null) {
      other = UserDetail.fromJson(otherRaw);
    }

    /// create conversation if not exist
    final collection = (await FirebaseFirestore.instance
            .collection(
      AppCollection.conversation,
    )
            .where(
      'senderId',
      whereIn: [selfId, widget.otherId],
    ).where(
      'receiverId',
      whereIn: [selfId, widget.otherId],
    ).get())
        .docs;

    if (collection.isEmpty) {
      await FirebaseFirestore.instance
          .collection(
            AppCollection.conversation,
          )
          .add(
            Conversation(
              senderId: selfId ?? '',
              receiverId: widget.otherId,
              senderName: self?.name ?? '',
              receiveName: other?.name ?? '',
            ).toJson(),
          );
    }

    setState(() {});
  }

  Future<void> sendMessage(String message) async {
    final collection =
        FirebaseFirestore.instance.collection(AppCollection.message);
    if (self != null && other != null) {
      final messageRaw = Message(
        senderId: self!.userDetailId,
        receiverId: other!.userDetailId,
        message: message,
      ).toJson();
      messageRaw['timestamp'] = FieldValue.serverTimestamp();
      await collection.add(messageRaw);
    }
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Builder(
        builder: (context) {
          if (self == null || other == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection(AppCollection.message)
                .where(
                  'senderId',
                  whereIn: [selfId, widget.otherId],
                )
                .where(
                  'receiverId',
                  whereIn: [selfId, widget.otherId],
                )
                .orderBy('timestamp', descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                final list = [...?snapshot.data?.docs].map((e) {
                  return Message.fromJson(e.data());
                }).toList();
                if (list.isEmpty) {
                  return Column(
                    children: [
                      const Expanded(child: Center(child: Text('No message'))),
                      MessageField(
                        loading: false,
                        onSend: sendMessage,
                      ),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          itemCount: list.length,
                          reverse: true,
                          padding: const EdgeInsets.all(20),
                          separatorBuilder: (context, index) {
                            return const SizedBox(height: 2);
                          },
                          itemBuilder: (context, index) {
                            final message = list[index];
                            final isSentByMe = message.senderId == selfId;
                            return Align(
                              alignment: isSentByMe
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: Container(
                                constraints:
                                    const BoxConstraints(maxWidth: 200),
                                decoration: BoxDecoration(
                                  color: isSentByMe
                                      ? Theme.of(context).colorScheme.primary
                                      : Theme.of(context).colorScheme.secondary,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                                child: Text(
                                  message.message,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: isSentByMe
                                        ? Theme.of(context)
                                            .colorScheme
                                            .onPrimary
                                        : Theme.of(context)
                                            .colorScheme
                                            .onSecondary,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      MessageField(
                        loading: false,
                        onSend: sendMessage,
                      ),
                    ],
                  );
                }
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          );
        },
      ),
    );
  }
}

class MessageField extends StatefulWidget {
  const MessageField({
    required this.loading,
    required this.onSend,
    super.key,
  });
  final bool loading;
  final void Function(String) onSend;

  @override
  State<MessageField> createState() => _MessageFieldState();
}

class _MessageFieldState extends State<MessageField> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: widget.loading,
      child: Row(
        children: [
          Expanded(
            child: ListTile(
              title: TextFormField(
                controller: controller,
                decoration: const InputDecoration(
                  hintText: 'Message...',
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              widget.onSend(controller.text.trim());
              controller.text = '';
            },
            icon: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}
