import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stray_dog_adoption/core/router/app_router.gr.dart';
import 'package:stray_dog_adoption/data/constant/app_constant.dart';
import 'package:stray_dog_adoption/feature/common/data/model/dog/dog.dart';
import 'package:stray_dog_adoption/feature/user/presentation/cubit/adopt/adopt_cubit.dart';
import 'package:stray_dog_adoption/main.dart';

class DogGridTile extends StatelessWidget {
  const DogGridTile({
    required this.dog,
    required this.onTap,
    this.showAdoption = false,
    super.key,
  });
  final Dog dog;
  final void Function() onTap;
  final bool showAdoption;

  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    final alreadyAdoptionRequest = dog.adoptionRequestUid.contains(uid);
    final rejected = dog.rejectedUid.contains(uid);
    final approved = dog.acceptedUid.contains(uid);
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(AppDimension.normal),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 128,
              height: 128,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).colorScheme.surfaceContainerHigh,
                image: dog.photoUrl != null
                    ? DecorationImage(
                        image: CachedNetworkImageProvider(dog.photoUrl!),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
            ),
            const SizedBox(height: AppDimension.small),
            Text(
              dog.name ?? '',
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            if (approved)
              const Text(
                'Approved',
                style: TextStyle(color: Colors.green),
              )
            else if (rejected)
              const Text(
                'Rejected',
                style: TextStyle(color: Colors.red),
              )
            else if (showAdoption)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FilledButton.icon(
                    icon: alreadyAdoptionRequest
                        ? const Icon(Icons.keyboard_arrow_right)
                        : const Icon(Icons.add),
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        alreadyAdoptionRequest
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    onPressed: alreadyAdoptionRequest
                        ? () {
                            context.read<AdoptCubit>().getAdoptionDetail(
                                  dogId: dog.dogId ?? '',
                                  uid: uid ?? '',
                                  onSuccess: (adoption) {
                                    appRouter.push(
                                      AdoptionDetailRoute(
                                        adoptionId: adoption.adoptionId,
                                        isForUser: true,
                                      ),
                                    );
                                  },
                                );
                          }
                        : () {
                            context.read<AdoptCubit>().adopt(
                                  dogId: dog.dogId ?? '',
                                  uid: uid ?? '',
                                );
                          },
                    label: Text(
                      alreadyAdoptionRequest ? 'Detail' : 'Adopt',
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add_comment),
                    onPressed: () {
                      final tabsRouter = AutoTabsRouter.of(context);
                      // ignore: cascade_invocations
                      tabsRouter.setActiveIndex(1);
                    },
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
