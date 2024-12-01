import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stray_dog_adoption/core/di/injection.dart';
import 'package:stray_dog_adoption/core/widget/loader/full_screen_loader.dart';
import 'package:stray_dog_adoption/data/constant/app_collection.dart';
import 'package:stray_dog_adoption/data/constant/app_key.dart';
import 'package:stray_dog_adoption/data/constant/user_type.dart';
import 'package:stray_dog_adoption/feature/common/data/model/adoption_request/adoption_request.dart';
import 'package:stray_dog_adoption/feature/common/data/model/dog/dog.dart';
import 'package:stray_dog_adoption/feature/common/presentation/widget/default_list_tile.dart';
import 'package:stray_dog_adoption/feature/user/presentation/cubit/adopt/adopt_cubit.dart';
import 'package:stray_dog_adoption/main.dart';

enum AdoptionDetailScreenEnum { admin, organizatin }

@RoutePage()
class AdoptionDetailScreen extends StatefulWidget {
  const AdoptionDetailScreen({
    required this.adoptionId,
    this.isForUser = false,
    super.key,
  });
  final String adoptionId;
  final bool isForUser;

  @override
  State<AdoptionDetailScreen> createState() => _AdoptionDetailScreenState();
}

class _AdoptionDetailScreenState extends State<AdoptionDetailScreen> {
  AdoptionRequest? adoptionRequest;
  // UserDetail? requestUser;
  // UserDetail? ownerUser;
  Dog? dog;

  Future<void> init() async {
    adoptionRequest = null;
    dog = null;
    setState(() {});
    final dogCollection = FirebaseFirestore.instance.collection(
      AppCollection.dog,
    );
    final adoption = FirebaseFirestore.instance.collection(
      AppCollection.adoption,
    );
    final adoptionRequestTemp = (await adoption
            .where(
              'adoptionId',
              isEqualTo: widget.adoptionId,
            )
            .get())
        .docs
        .firstOrNull
        ?.data();
    if (adoptionRequestTemp != null) {
      adoptionRequest = AdoptionRequest.fromJson(adoptionRequestTemp);
      final dogTemp = (await dogCollection
              .where(
                'dogId',
                isEqualTo: adoptionRequest?.dogId ?? '',
              )
              .get())
          .docs
          .firstOrNull
          ?.data();
      if (dogTemp != null) {
        dog = Dog.fromJson(dogTemp);
      }
    }

    setState(() {});
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  Future<void> onSubmitStatus({
    required String status,
    required AdoptionDetailScreenEnum enums,
  }) async {
    final reason = await showDialog<String?>(
      context: context,
      builder: (context) {
        return const ReasonDialog();
      },
    );
    if (reason != null && mounted) {
      final requirestUid = (await FirebaseFirestore.instance
              .collection(AppCollection.adoption)
              .where('adoptionId', isEqualTo: widget.adoptionId)
              .get())
          .docs
          .firstOrNull?['userId'] as String;

      // ignore: use_build_context_synchronously
      await context.read<AdoptCubit>().reason(
            adoptedUid: requirestUid,
            adoptionId: widget.adoptionId,
            enums: enums,
            status: status,
            reason: reason,
            onSuccess: (newValue) {
              adoptionRequest = newValue;
              setState(() {});
            },
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final userType = getIt<SharedPreferences>().getString(AppKey.userType);
    return BlocBuilder<AdoptCubit, AdoptState>(
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                title: const Text('Detail'),
                actions: widget.isForUser
                    ? [
                        FilledButton.icon(
                          icon: const Icon(Icons.close),
                          label: const Text('Cancel'),
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              Theme.of(context).colorScheme.error,
                            ),
                          ),
                          onPressed: () {
                            context.read<AdoptCubit>().cancle(
                                  dogId: dog?.dogId ?? '',
                                  uid: adoptionRequest?.userId ?? '',
                                );
                            appRouter.maybePop();
                          },
                        ),
                      ]
                    : null,
              ),
              body: dog == null || adoptionRequest == null
                  ? const Center(child: CircularProgressIndicator())
                  : ListView(
                      children: [
                        Align(
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .surfaceContainerHigh,
                              borderRadius: BorderRadius.circular(200),
                              image: dog?.photoUrl != null &&
                                      dog?.photoUrl?.trim().isEmpty == false
                                  ? DecorationImage(
                                      image: CachedNetworkImageProvider(
                                        dog!.photoUrl!,
                                      ),
                                      fit: BoxFit.cover,
                                    )
                                  : null,
                            ),
                          ),
                        ),
                        DefaultListTile(
                          title: 'Name',
                          subtitle: dog?.name ?? '',
                        ),
                        DefaultListTile(
                          title: 'Type',
                          subtitle: dog?.type ?? '',
                        ),
                        DefaultListTile(
                          title: 'Condition',
                          subtitle: dog?.condition ?? '',
                        ),
                        DefaultListTile(
                          title: 'Color',
                          subtitle: dog?.color ?? '',
                        ),
                        DefaultListTile(
                          title: 'Weight',
                          subtitle: dog?.weight?.toStringAsFixed(2) ?? '',
                        ),
                        DefaultListTile(
                          title: 'Age',
                          subtitle: dog?.age?.toString() ?? '',
                        ),
                        DefaultListTile(
                          title: 'Gender',
                          subtitle: dog?.gender ?? '',
                        ),
                        DefaultListTile(
                          title: 'Trait',
                          subtitle: dog?.trait ?? '',
                        ),
                        DefaultListTile(
                          title: 'Location',
                          subtitle: dog?.location ?? '',
                        ),
                        const Divider(),
                        DefaultListTile(
                          title: 'Organization',
                          subtitle:
                              // ignore: lines_longer_than_80_chars, use_if_null_to_convert_nulls_to_bools
                              adoptionRequest?.organizationDecision.reason
                                          .isEmpty ==
                                      true
                                  ? ''
                                  // ignore: lines_longer_than_80_chars
                                  : 'Note: ${adoptionRequest?.organizationDecision.reason ?? ''}',
                          trailing: DecisionOption(
                            disabled: userType != UserType.organization,
                            value: adoptionRequest?.organizationDecision.status,
                            onChanged: (value) {
                              if (value != null) {
                                onSubmitStatus(
                                  status: value,
                                  enums: AdoptionDetailScreenEnum.organizatin,
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
            ),
            if (state.loading) const FullScreenLoader(),
          ],
        );
      },
    );
  }
}

class ReasonDialog extends StatefulWidget {
  const ReasonDialog({super.key});

  @override
  State<ReasonDialog> createState() => _ReasonDialogState();
}

class _ReasonDialogState extends State<ReasonDialog> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Reason'),
      content: Form(
        key: _formKey,
        child: TextFormField(
          controller: _controller,
          validator: (value) {
            // ignore: use_if_null_to_convert_nulls_to_bools
            if (value?.trim().isEmpty == true) {
              return 'Required';
            }
            return null;
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () {
            // ignore: use_if_null_to_convert_nulls_to_bools
            if (_formKey.currentState?.validate() == true) {
              Navigator.of(context).pop(_controller.text.trim());
            }
          },
          child: const Text('Okay'),
        ),
      ],
    );
  }
}
