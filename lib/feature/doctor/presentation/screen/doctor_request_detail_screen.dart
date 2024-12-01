import 'package:auto_route/auto_route.dart';
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
import 'package:stray_dog_adoption/feature/common/presentation/screen/adoption_detail_screen/adoption_detail_screen.dart';
import 'package:stray_dog_adoption/feature/common/presentation/widget/default_list_tile.dart';
import 'package:stray_dog_adoption/feature/doctor/presentation/cubit/doctor_request/doctor_request_cubit.dart';
import 'package:stray_dog_adoption/main.dart';

@RoutePage()
class DoctorRequestDetailScreen extends StatefulWidget {
  const DoctorRequestDetailScreen({
    required this.doctorRequestId,
    this.isForUser = false,
    super.key,
  });
  final String doctorRequestId;
  final bool isForUser;

  @override
  State<DoctorRequestDetailScreen> createState() =>
      _DoctorRequestDetailScreenState();
}

class _DoctorRequestDetailScreenState extends State<DoctorRequestDetailScreen> {
  DoctorRequest? doctorRequest;

  Future<void> init() async {
    doctorRequest = null;
    setState(() {});
    final doctor = FirebaseFirestore.instance.collection(
      AppCollection.doctor,
    );
    final doctorRequestTemp = (await doctor
            .where(
              'doctorRequestId',
              isEqualTo: widget.doctorRequestId,
            )
            .get())
        .docs
        .firstOrNull
        ?.data();
    if (doctorRequestTemp != null) {
      doctorRequest = DoctorRequest.fromJson(doctorRequestTemp);
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
  }) async {
    final reason = await showDialog<String?>(
      context: context,
      builder: (context) {
        return const ReasonDialog();
      },
    );
    if (reason != null && mounted) {
      await context.read<DoctorRequestCubit>().decision(
            doctorRequestId: doctorRequest?.doctorRequestId ?? '',
            status: status,
            reason: reason,
            onSuccess: (newValue) {
              doctorRequest = newValue;
              setState(() {});
            },
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final userType = getIt<SharedPreferences>().getString(AppKey.userType);
    return BlocBuilder<DoctorRequestCubit, DoctorRequestState>(
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
                            context.read<DoctorRequestCubit>().cancel(
                                  doctorRequestId:
                                      doctorRequest?.doctorRequestId ?? '',
                                );
                            appRouter.maybePop();
                          },
                        ),
                      ]
                    : null,
              ),
              body: doctorRequest == null
                  ? const Center(child: CircularProgressIndicator())
                  : ListView(
                      children: [
                        DefaultListTile(
                          title: "Requested User's Email",
                          subtitle: doctorRequest?.requestUserEmail ?? '',
                        ),
                        const Divider(),
                        DefaultListTile(
                          title: 'Doctor',
                          subtitle:
                              // ignore: lines_longer_than_80_chars, use_if_null_to_convert_nulls_to_bools
                              doctorRequest?.doctorDecision.reason.isEmpty ==
                                      true
                                  ? ''
                                  // ignore: lines_longer_than_80_chars
                                  : 'Note: ${doctorRequest?.doctorDecision.reason ?? ''}',
                          trailing: DecisionOption(
                            disabled: userType != UserType.doctor,
                            value: doctorRequest?.doctorDecision.status,
                            onChanged: (value) {
                              if (value != null) {
                                onSubmitStatus(
                                  status: value,
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
