// ignore: lines_longer_than_80_chars
// ignore_for_file: use_build_context_synchronously, inference_failure_on_instance_creation

import 'dart:async';

import 'package:another_flushbar/flushbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stray_dog_adoption/core/router/app_router.gr.dart';
import 'package:stray_dog_adoption/data/constant/app_collection.dart';
import 'package:stray_dog_adoption/data/constant/user_type.dart';
import 'package:stray_dog_adoption/feature/common/data/model/notification/notification.dart'
    as n;
import 'package:stray_dog_adoption/feature/common/data/model/user/user.dart';
import 'package:stray_dog_adoption/feature/common/presentation/cubit/login/login_cubit.dart';
import 'package:stray_dog_adoption/feature/user/presentation/screen/add_user_screen/add_user_screen.dart';
import 'package:stray_dog_adoption/main.dart';

StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? notificaitonSub;

@RoutePage()
class UserMainScreen extends StatefulWidget {
  const UserMainScreen({super.key});

  @override
  State<UserMainScreen> createState() => _UserMainScreenState();
}

class _UserMainScreenState extends State<UserMainScreen> {
  Stream<DocumentSnapshot<Map<String, dynamic>>>? userDetail;
  User? user;

  @override
  void initState() {
    () {
      user = context.read<LoginCubit>().state.user;
      userDetail = FirebaseFirestore.instance
          .collection(AppCollection.user)
          .doc(user?.uid)
          .snapshots();
      setState(() {});
    }.call();

    super.initState();
  }

  @override
  void dispose() {
    disposeListener();
    super.dispose();
  }

  void listen() {
    notificaitonSub = FirebaseFirestore.instance
        .collection(AppCollection.notification)
        .where('userId', isEqualTo: user?.uid)
        .snapshots()
        .listen((event) {
      for (final e in event.docs) {
        final notificaiton = n.Notification.fromJson(e.data());
        // ignore: lines_longer_than_80_chars
        final organizationDec =
            notificaiton.adoptionRequest?.organizationDecision;
        final doctorDec = notificaiton.doctorRequest?.doctorDecision;
        if (organizationDec?.status == AppDecision.approved) {
          Flushbar(
            title: 'Adoption Request Accepted',
            message: 'Adoption Message: ${organizationDec?.reason ?? ''}',
          ).show(context);
        } else if (organizationDec?.status == AppDecision.rejected) {
          Flushbar(
            title: 'Adoption Request Rejected',
            message: 'Adoption Message: ${organizationDec?.reason ?? ''}',
          ).show(context);
        } else if (doctorDec?.status == AppDecision.approved) {
          Flushbar(
            title: 'Doctor Request Accepted',
            message: 'Doctor Message: ${doctorDec?.reason ?? ''}',
          ).show(context);
        } else if (doctorDec?.status == AppDecision.rejected) {
          Flushbar(
            title: 'Doctor Request Rejected',
            message: 'Doctor Message: ${doctorDec?.reason ?? ''}',
          ).show(context);
        }
      }
    });
  }

  void disposeListener() {
    notificaitonSub?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: userDetail,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final uesrData = snapshot.data?.data();
          if (uesrData == null) {
            return AddUserScreen(
              popOnSuccess: false,
              userDetail: UserDetail(
                userDetailId: user?.uid ?? '',
                type: UserType.user,
                email: user?.email ?? '',
              ),
              showSave: true,
              showLogout: true,
            );
          } else {
            return AutoTabsRouter(
              routes: [
                UserDogRoute(),
                MessageDetailRoute(otherId: kAdminUid),
                const UserDoctorRoute(),
                const UserSettingRoute(),
              ],
              transitionBuilder: (context, child, animation) => FadeTransition(
                opacity: animation,
                child: child,
              ),
              builder: (context, child) {
                final tabsRouter = AutoTabsRouter.of(context);
                return Scaffold(
                  appBar: AppBar(
                    title: Text(tabsRouter.current.title(context)),
                    actions: [
                      IconButton(
                        onPressed: () {
                          appRouter.push(const NotificationRoute());
                        },
                        icon: Badge(
                          label: StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection(AppCollection.notification)
                                .where('userId', isEqualTo: user?.uid)
                                .where('seen', isEqualTo: false)
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.active) {
                                final list = [...?snapshot.data?.docs];
                                return Text(list.length.toString());
                              } else {
                                return const SizedBox.shrink();
                              }
                            },
                          ),
                          child: const Icon(Icons.notifications),
                        ),
                      ),
                    ],
                  ),
                  body: child,
                  floatingActionButton: tabsRouter.activeIndex == 2
                      ? FloatingActionButton.extended(
                          onPressed: () {
                            appRouter.push(DoctorRequestRoute(isForUser: true));
                          },
                          label: const Text('My Requests'),
                        )
                      : const SizedBox.shrink(),
                  bottomNavigationBar: NavigationBar(
                    selectedIndex: tabsRouter.activeIndex,
                    onDestinationSelected: tabsRouter.setActiveIndex,
                    destinations: const [
                      NavigationDestination(
                        label: 'Dog',
                        icon: Icon(Icons.pets_outlined),
                      ),
                      NavigationDestination(
                        label: 'Message',
                        icon: Icon(Icons.message_outlined),
                      ),
                      NavigationDestination(
                        label: 'Doctor',
                        icon: Icon(Icons.local_hospital_outlined),
                      ),
                      NavigationDestination(
                        label: 'Settings',
                        icon: Icon(Icons.settings_outlined),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        } else {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
