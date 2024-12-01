import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stray_dog_adoption/core/di/injection.dart';
import 'package:stray_dog_adoption/core/router/app_router.gr.dart';
import 'package:stray_dog_adoption/core/widget/loader/full_screen_loader.dart';
import 'package:stray_dog_adoption/data/constant/app_collection.dart';
import 'package:stray_dog_adoption/data/constant/app_key.dart';
import 'package:stray_dog_adoption/data/constant/user_type.dart';
import 'package:stray_dog_adoption/feature/common/data/model/dog/dog.dart';
import 'package:stray_dog_adoption/feature/common/data/model/user/user.dart';
import 'package:stray_dog_adoption/feature/common/presentation/widget/dog_grid_tile/dog_grid_tile.dart';
import 'package:stray_dog_adoption/feature/user/presentation/cubit/adopt/adopt_cubit.dart';
import 'package:stray_dog_adoption/main.dart';

@RoutePage()
class UserDogScreen extends StatefulWidget {
  const UserDogScreen({
    this.uid,
    super.key,
  });
  final String? uid;

  @override
  State<UserDogScreen> createState() => _UserDogScreenState();
}

class _UserDogScreenState extends State<UserDogScreen> {
  final _query = TextEditingController();
  List<UserDetail>? organization;
  String? currentOrg;

  Future<void> init() async {
    organization = (await FirebaseFirestore.instance
            .collection(AppCollection.user)
            .where('type', isEqualTo: UserType.organization)
            .get())
        .docs
        .map((e) {
      return UserDetail.fromJson(e.data());
    }).toList();
    final userType = getIt<SharedPreferences>().getString(AppKey.userType);
    if (userType == UserType.organization) {
      currentOrg = organization
          ?.where(
            (e) => e.userDetailId == FirebaseAuth.instance.currentUser?.uid,
          )
          .firstOrNull
          ?.email;
    } else {
      currentOrg = organization?.firstOrNull?.email;
    }
    setState(() {});
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  void dispose() {
    _query.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentUserUid = FirebaseAuth.instance.currentUser?.uid;
    Stream<QuerySnapshot<Map<String, dynamic>>> stream;
    final userType = getIt<SharedPreferences>().getString(AppKey.userType);
    final dontShowDetail = userType == UserType.doctor;
    final showAdoption = userType == UserType.user;

    var temp = FirebaseFirestore.instance
        .collection(AppCollection.dog)
        .where('adopted', isNull: false);

    if (userType == UserType.user || userType == UserType.doctor) {
      temp = temp.where('adopted', isEqualTo: false);
    }

    if (widget.uid == null) {
      stream = temp.snapshots();
    } else {
      stream = temp.where('userId', isEqualTo: widget.uid).snapshots();
    }

    if (currentOrg == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return BlocBuilder<AdoptCubit, AdoptState>(
      builder: (context, adoptState) {
        return Stack(
          children: [
            Column(
              children: [
                AbsorbPointer(
                  absorbing: userType == UserType.organization,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: DropdownButton(
                        value: currentOrg,
                        onChanged: (value) {
                          currentOrg = value;
                          setState(() {});
                        },
                        hint: const Text('Select Organization'),
                        items: [...?organization].map((e) {
                          return DropdownMenuItem(
                            value: e.email,
                            child: Text(e.name),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                if (currentOrg != null)
                  Expanded(
                    child: StreamBuilder(
                      stream: stream,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.active) {
                          var list = [...?snapshot.data?.docs].map((e) {
                            return Dog.fromJson(e.data());
                          }).where((e) {
                            if (e.acceptedUid.isNotEmpty) {
                              if (e.acceptedUid.contains(currentUserUid)) {
                                return true;
                              }
                              return false;
                            }
                            return true;
                          }).toList();
                          if (_query.text.trim().isNotEmpty) {
                            list = list.where((e) {
                              if (e.name == null) {
                                return false;
                              }
                              return e.name!
                                  .toLowerCase()
                                  .contains(_query.text.toLowerCase().trim());
                            }).toList();
                          }
                          if (currentOrg != null && currentOrg != 'All') {
                            list = list
                                .where((e) => e.organizationEmail == currentOrg)
                                .toList();
                          }
                          return Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: TextFormField(
                                  controller: _query,
                                  onEditingComplete: () {
                                    setState(() {});
                                  },
                                  onChanged: (value) {
                                    if (value.isEmpty) {
                                      setState(() {});
                                    }
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Search...',
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {});
                                      },
                                      icon: const Icon(Icons.search),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GridView.count(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.8,
                                  children: List.generate(
                                    list.length,
                                    (index) {
                                      final dog = list[index];
                                      return AbsorbPointer(
                                        absorbing: dontShowDetail,
                                        child: DogGridTile(
                                          dog: dog,
                                          showAdoption: showAdoption,
                                          onTap: () {
                                            appRouter
                                                .push(AddDogRoute(dog: dog));
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ),
              ],
            ),
            if (adoptState.loading) const FullScreenLoader(),
          ],
        );
      },
    );
  }
}
