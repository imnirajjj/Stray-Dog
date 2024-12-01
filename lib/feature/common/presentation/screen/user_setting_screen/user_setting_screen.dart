import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stray_dog_adoption/core/widget/loader/full_screen_loader.dart';
import 'package:stray_dog_adoption/data/constant/app_collection.dart';
import 'package:stray_dog_adoption/data/constant/app_constant.dart';
import 'package:stray_dog_adoption/feature/common/data/model/user/user.dart';
import 'package:stray_dog_adoption/feature/common/presentation/cubit/login/login_cubit.dart';

@RoutePage()
class UserSettingScreen extends StatefulWidget {
  const UserSettingScreen({super.key});

  @override
  State<UserSettingScreen> createState() => _UserSettingScreenState();
}

class _UserSettingScreenState extends State<UserSettingScreen> {
  UserDetail? userDetail;

  final _name = TextEditingController();
  final _type = TextEditingController();
  final _license = TextEditingController();
  final _experience = TextEditingController();
  final _workplace = TextEditingController();

  Future<void> init() async {
    final userDetailRaw = (await FirebaseFirestore.instance
            .collection(AppCollection.user)
            .doc(FirebaseAuth.instance.currentUser?.uid)
            .get())
        .data();
    if (userDetailRaw != null) {
      userDetail = UserDetail.fromJson(userDetailRaw);
      _name.text = userDetail?.name ?? '';
      _type.text = userDetail?.type ?? '';
      _license.text = userDetail?.licenseNumber ?? '';
      _experience.text = userDetail?.doctorExperience ?? '';
      _workplace.text = userDetail?.currentOrPreviousWorkPlace ?? '';
      setState(() {});
    }
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  void dispose() {
    _name.dispose();
    _type.dispose();
    _license.dispose();
    _experience.dispose();
    _workplace.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Stack(
          children: [
            ListView(
              padding: const EdgeInsets.all(AppDimension.normal),
              children: [
                Form(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(AppDimension.normal),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'My Profile',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: AppDimension.normal),
                          if (userDetail?.photoUrl != null)
                            Align(
                              child: Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .surfaceContainerHigh,
                                  image: userDetail?.photoUrl != null &&
                                          // ignore: use_if_null_to_convert_nulls_to_bools
                                          userDetail?.photoUrl
                                                  ?.trim()
                                                  .isEmpty ==
                                              false
                                      ? DecorationImage(
                                          image: CachedNetworkImageProvider(
                                            userDetail!.photoUrl!,
                                          ),
                                          fit: BoxFit.cover,
                                        )
                                      : null,
                                ),
                              ),
                            ),
                          TextFormField(
                            initialValue: state.user?.email,
                            decoration: const InputDecoration(
                              hintText: 'Email',
                              labelText: 'Email',
                            ),
                            readOnly: true,
                          ),
                          if (userDetail != null)
                            Column(
                              children: [
                                if (userDetail?.name != null)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: TextFormField(
                                      controller: _name,
                                      decoration: const InputDecoration(
                                        hintText: 'Name',
                                        labelText: 'Name',
                                      ),
                                      readOnly: true,
                                    ),
                                  ),
                                if (userDetail?.type != null)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: TextFormField(
                                      controller: _type,
                                      decoration: const InputDecoration(
                                        hintText: 'Type',
                                        labelText: 'Type',
                                      ),
                                      readOnly: true,
                                    ),
                                  ),
                                if (userDetail?.licenseNumber != null)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: TextFormField(
                                      controller: _license,
                                      decoration: const InputDecoration(
                                        hintText: 'License Number',
                                        labelText: 'License Number',
                                      ),
                                      readOnly: true,
                                    ),
                                  ),
                                if (userDetail?.doctorExperience != null)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: TextFormField(
                                      controller: _experience,
                                      decoration: const InputDecoration(
                                        hintText: 'Experience',
                                        labelText: 'Experience',
                                      ),
                                      readOnly: true,
                                    ),
                                  ),
                                if (userDetail?.currentOrPreviousWorkPlace !=
                                    null)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: TextFormField(
                                      controller: _workplace,
                                      decoration: const InputDecoration(
                                        hintText:
                                            'Current / Previous Work Place',
                                        labelText:
                                            'Current / Previous Work Place',
                                      ),
                                      readOnly: true,
                                    ),
                                  ),
                              ],
                            ),
                          // const SizedBox(height: AppDimension.normal),
                          // AppButton.primary(
                          //   text: 'Save Changes',
                          //   onPressed: () {},
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton.icon(
                  label: const Text('Logout'),
                  icon: const Icon(Icons.logout),
                  onPressed: () {
                    context.read<LoginCubit>().logout();
                  },
                ),
              ],
            ),
            if (state.loading) const FullScreenLoader(),
          ],
        );
      },
    );
  }
}
