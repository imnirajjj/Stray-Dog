import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stray_dog_adoption/core/router/app_router.gr.dart';
import 'package:stray_dog_adoption/data/constant/app_collection.dart';
import 'package:stray_dog_adoption/data/constant/user_type.dart';
import 'package:stray_dog_adoption/feature/common/data/model/user/user.dart';
import 'package:stray_dog_adoption/feature/common/presentation/cubit/login/login_cubit.dart';
import 'package:stray_dog_adoption/feature/user/presentation/screen/add_doctor_screen/add_doctor_screen.dart';
import 'package:stray_dog_adoption/main.dart';

@RoutePage()
class DoctorMainScreen extends StatefulWidget {
  const DoctorMainScreen({super.key});

  @override
  State<DoctorMainScreen> createState() => _DoctorMainScreenState();
}

class _DoctorMainScreenState extends State<DoctorMainScreen> {
  Stream<DocumentSnapshot<Map<String, dynamic>>>? doctorDetail;
  User? user;

  @override
  void initState() {
    () {
      user = context.read<LoginCubit>().state.user;
      doctorDetail = FirebaseFirestore.instance
          .collection(AppCollection.user)
          .doc(user?.uid)
          .snapshots();
      setState(() {});
    }.call();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: doctorDetail,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final uesrData = snapshot.data?.data();
          if (uesrData == null) {
            return AddDoctorScreen(
              popOnSuccess: false,
              userDetail: UserDetail(
                userDetailId: user?.uid ?? '',
                type: UserType.doctor,
                email: user?.email ?? '',
              ),
              showSave: true,
              showLogout: true,
            );
          } else {
            return AutoTabsRouter(
              routes: [
                DoctorRequestRoute(),                
                MessageDetailRoute(otherId: kAdminUid),
                const UserSettingRoute(),
              ],
              transitionBuilder: (context, child, animation) => FadeTransition(
                opacity: animation,
                child: child,
              ),
              builder: (context, child) {
                final tabsRouter = AutoTabsRouter.of(context);
                return Scaffold(
                  appBar: tabsRouter.activeIndex != 0 ? AppBar(
                    title: Text(tabsRouter.current.title(context)),
                    centerTitle: tabsRouter.activeIndex != 2,
                  ) : null,
                  body: child,
                  floatingActionButton: tabsRouter.activeIndex == 0
                      ? FloatingActionButton.extended(
                          onPressed: () {
                            appRouter.push(DoctorRequestRoute());
                          },
                          label: const Text('My Requests'),
                        )
                      : const SizedBox.shrink(),
                  bottomNavigationBar: NavigationBar(
                    selectedIndex: tabsRouter.activeIndex,
                    onDestinationSelected: tabsRouter.setActiveIndex,
                    destinations: const [
                      NavigationDestination(
                        label: 'Request',
                        icon: Icon(Icons.pets_outlined),
                      ),
                      NavigationDestination(
                        label: 'Message',
                        icon: Icon(Icons.message),
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
