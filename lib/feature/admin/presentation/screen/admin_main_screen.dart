import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stray_dog_adoption/core/router/app_router.gr.dart';
import 'package:stray_dog_adoption/feature/admin/presentation/cubit/admin/admin_cubit.dart';
import 'package:stray_dog_adoption/feature/common/data/model/user/user.dart';
import 'package:stray_dog_adoption/feature/common/presentation/cubit/login/login_cubit.dart';
import 'package:stray_dog_adoption/feature/common/presentation/screen/user_selector_screen/user_selector_screen.dart';
import 'package:stray_dog_adoption/main.dart';

@RoutePage()
class AdminMainScreen extends StatefulWidget {
  const AdminMainScreen({super.key});

  @override
  State<AdminMainScreen> createState() => _AdminMainScreenState();
}

class _AdminMainScreenState extends State<AdminMainScreen> {
  bool success = false;
  void init() {
    context.read<AdminCubit>().init(
      onLogout: () {
        context.read<LoginCubit>().logout();
      },
      onSuccess: () {
        success = true;
        setState(() {});
      },
    );
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return success
        ? const AdminMainScreenContent()
        : const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}

class AdminMainScreenContent extends StatelessWidget {
  const AdminMainScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [
        UserDogRoute(),
        const UserMessageRoute(),
        const AdminOrganizationRoute(),
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
            actions: tabsRouter.activeIndex == 1
                ? [
                    IconButton(
                      onPressed: () async {
                        final userDetail =
                            await showModalBottomSheet<UserDetail?>(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) => const UserSelectorScreen(),
                        );
                        if (userDetail != null) {
                          await appRouter.push(
                            MessageDetailRoute(
                              otherId: userDetail.userDetailId,
                            ),
                          );
                        }
                      },
                      icon: const Icon(Icons.message),
                    ),
                  ]
                : [],
          ),
          body: child,
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
                label: 'Organization',
                icon: Icon(Icons.domain_outlined),
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
}
