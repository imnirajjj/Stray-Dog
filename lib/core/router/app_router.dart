import 'package:auto_route/auto_route.dart';

import 'package:stray_dog_adoption/core/router/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: AppTypeSelectionRoute.page),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: RegisterRoute.page),
        AutoRoute(
          page: UserMainRoute.page,
          children: [
            AutoRoute(
              page: UserDogRoute.page,
              initial: true,
              title: (context, data) => 'Dog',
            ),
            AutoRoute(
              page: MessageDetailRoute.page,
              title: (context, data) => 'Message',
            ),
            AutoRoute(
              page: UserDoctorRoute.page,
              title: (context, data) => 'Doctor',
            ),
            AutoRoute(
              page: UserSettingRoute.page,
              title: (context, data) => 'Setting',
            ),
          ],
        ),
        AutoRoute(
          page: AdminMainRoute.page,
          children: [
            AutoRoute(
              page: UserDogRoute.page,
              initial: true,
              title: (context, data) => 'Dog',
            ),
            AutoRoute(
              page: UserMessageRoute.page,
              title: (context, data) => 'Message',
            ),
            AutoRoute(
              page: AdoptionRequestRoute.page,
              title: (context, data) => 'Dog Request',
            ),
            AutoRoute(
              page: AdminOrganizationRoute.page,
              title: (context, data) => 'Organization',
            ),
            AutoRoute(
              page: UserDoctorRoute.page,
              title: (context, data) => 'Doctor',
            ),
            AutoRoute(
              page: UserSettingRoute.page,
              title: (context, data) => 'Setting',
            ),
          ],
        ),
        AutoRoute(
          page: DoctorMainRoute.page,
          children: [
            AutoRoute(
              page: DoctorRequestRoute.page,
              initial: true,
              title: (context, data) => 'Request',
            ),
            AutoRoute(
              page: MessageDetailRoute.page,
              title: (context, data) => 'Message',
            ),
            AutoRoute(
              page: UserSettingRoute.page,
              title: (context, data) => 'Setting',
            ),
          ],
        ),
        AutoRoute(
          page: OrganizationMainRoute.page,
          children: [
            AutoRoute(
              page: UserDogRoute.page,
              initial: true,
              title: (context, data) => 'Dog',
            ),
            AutoRoute(
              page: AdoptionRequestRoute.page,
              title: (context, data) => 'Dog Request',
            ),
            AutoRoute(
              page: MessageDetailRoute.page,
              title: (context, data) => 'Message',
            ),
            AutoRoute(
              page: UserSettingRoute.page,
              title: (context, data) => 'Setting',
            ),
          ],
        ),
        AutoRoute(page: UserListRoute.page),
        AutoRoute(page: AddOrganizationRoute.page),
        AutoRoute(page: AddDoctorRoute.page),
        AutoRoute(page: AddDogRoute.page),
        AutoRoute(page: AdoptionDetailRoute.page),
        AutoRoute(page: DoctorRequestDetailRoute.page),
        AutoRoute(page: DoctorRequestRoute.page),
        AutoRoute(page: MessageDetailRoute.page),
        AutoRoute(page: NotificationRoute.page),
      ];
}
