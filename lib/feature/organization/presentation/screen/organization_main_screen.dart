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
import 'package:stray_dog_adoption/feature/user/presentation/screen/add_organization_screen/add_organization_screen.dart';
import 'package:stray_dog_adoption/main.dart';

@RoutePage()
class OrganizationMainScreen extends StatefulWidget {
  const OrganizationMainScreen({super.key});

  @override
  State<OrganizationMainScreen> createState() => _OrganizationMainScreenState();
}

class _OrganizationMainScreenState extends State<OrganizationMainScreen> {
  Stream<DocumentSnapshot<Map<String, dynamic>>>? orgDetail;
  User? user;

  @override
  void initState() {
    () {
      user = context.read<LoginCubit>().state.user;
      orgDetail = FirebaseFirestore.instance
          .collection(AppCollection.user)
          .doc(user?.uid)
          .snapshots();
      setState(() {});
    }.call();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (orgDetail == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return StreamBuilder(
      stream: orgDetail,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final uesrData = snapshot.data?.data();
          if (uesrData == null) {
            return AddOrganizationScreen(
              popOnSuccess: false,
              userDetail: UserDetail(
                userDetailId: user?.uid ?? '',
                type: UserType.organization,
                email: user?.email ?? '',
              ),
              showSave: true,
              showLogout: true,
            );
          } else {
            return AutoTabsRouter(
              routes: [
                UserDogRoute(uid: FirebaseAuth.instance.currentUser?.uid),
                AdoptionRequestRoute(),
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
                  appBar: AppBar(
                    title: Text(tabsRouter.current.title(context)),
                  ),
                  body: child,
                  floatingActionButton: tabsRouter.activeIndex == 0
                      ? FloatingActionButton(
                          child: const Icon(Icons.add),
                          onPressed: () {
                            appRouter.push(AddDogRoute());
                          },
                        )
                      : null,
                  bottomNavigationBar: NavigationBar(
                    selectedIndex: tabsRouter.activeIndex,
                    onDestinationSelected: tabsRouter.setActiveIndex,
                    destinations: const [
                      NavigationDestination(
                        label: 'Dog',
                        icon: Icon(Icons.pets_outlined),
                      ),
                      NavigationDestination(
                        label: 'Dog Request',
                        icon: Icon(Icons.arrow_upward),
                      ),
                      NavigationDestination(
                        label: 'Message',
                        icon: Icon(Icons.message_outlined),
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
