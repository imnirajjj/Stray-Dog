import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stray_dog_adoption/core/di/injection.dart';
import 'package:stray_dog_adoption/data/constant/app_constant.dart';
import 'package:stray_dog_adoption/data/constant/app_key.dart';
import 'package:stray_dog_adoption/data/constant/user_type.dart';
import 'package:stray_dog_adoption/feature/common/data/model/user/user.dart';
import 'package:stray_dog_adoption/feature/doctor/presentation/cubit/doctor_request/doctor_request_cubit.dart';

class DoctorGridTile extends StatelessWidget {
  const DoctorGridTile({
    required this.userDetail,
    required this.onTap,
    required this.onRequest,
    super.key,
  });
  final UserDetail userDetail;
  final void Function() onTap;
  final void Function() onRequest;

  @override
  Widget build(BuildContext context) {
    final currentUserType =
        getIt<SharedPreferences>().getString(AppKey.userType);
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
                color: Theme.of(context).colorScheme.surfaceContainer,
                borderRadius: BorderRadius.circular(200),
                image: userDetail.photoUrl != null
                    ? DecorationImage(
                        image: CachedNetworkImageProvider(userDetail.photoUrl!),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
            ),
            Text(
              userDetail.name,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: AppDimension.small),
            if (currentUserType == UserType.user)
              ElevatedButton(
                onPressed: () {
                  context.read<DoctorRequestCubit>().request(
                        doctorId: userDetail.userDetailId,
                        alreadyExistsCallback: () {
                          Fluttertoast.showToast(
                            msg:
                                // ignore: lines_longer_than_80_chars
                                'You already have visit request for this doctor',
                          );
                        },
                      );
                },
                child: const Text('Request Visit'),
              ),
          ],
        ),
      ),
    );
  }
}
