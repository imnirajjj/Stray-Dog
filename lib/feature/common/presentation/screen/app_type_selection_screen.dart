import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stray_dog_adoption/core/router/app_router.gr.dart';
import 'package:stray_dog_adoption/data/constant/app_constant.dart';
import 'package:stray_dog_adoption/data/constant/user_type.dart';
import 'package:stray_dog_adoption/gen/assets.gen.dart';
import 'package:stray_dog_adoption/main.dart';

@RoutePage()
class AppTypeSelectionScreen extends StatelessWidget {
  const AppTypeSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Type'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: AppDimension.normal,
              crossAxisSpacing: AppDimension.normal,
              padding: const EdgeInsets.all(AppDimension.normal),
              children: [
                AppTypeTile(
                  title: 'User',
                  image: Assets.images.user.path,
                  onTap: () {
                    appRouter.push(LoginRoute(userType: UserType.user));
                  },
                ),
                AppTypeTile(
                  title: 'Doctor',
                  image: Assets.images.doctor.path,
                  onTap: () {
                    appRouter.push(LoginRoute(userType: UserType.doctor));
                  },
                ),
                AppTypeTile(
                  title: 'Organization',
                  image: Assets.images.adopt.path,
                  onTap: () {
                    appRouter.push(LoginRoute(userType: UserType.organization));
                  },
                ),
                AppTypeTile(
                  title: 'Admin',
                  image: Assets.images.admin.path,
                  onTap: () {
                    appRouter.push(LoginRoute(userType: UserType.admin));
                  },
                ),
              ],
            ),
          ),
          const Text(
            'Contact us: kharbujaniraj111@gmail.com',
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
          Padding(padding: MediaQuery.paddingOf(context)),
        ],
      ),
    );
  }
}

class AppTypeTile extends StatelessWidget {
  const AppTypeTile({
    required this.title,
    required this.image,
    required this.onTap,
    super.key,
  });

  final String image;
  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 128,
              height: 128,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
