import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stray_dog_adoption/core/di/injection.dart';
import 'package:stray_dog_adoption/core/widget/loader/full_screen_loader.dart';
import 'package:stray_dog_adoption/data/constant/app_key.dart';
import 'package:stray_dog_adoption/data/constant/user_type.dart';
import 'package:stray_dog_adoption/feature/common/data/model/user/user.dart';
import 'package:stray_dog_adoption/feature/user/presentation/cubit/doctor/doctor_cubit.dart';

@RoutePage()
class AddDoctorScreen extends StatefulWidget {
  const AddDoctorScreen({
    required this.userDetail,
    this.popOnSuccess = true,
    this.showLogout = false,
    this.showSave = false,
    super.key,
  });
  final UserDetail userDetail;
  final bool popOnSuccess;
  final bool showLogout;
  final bool showSave;

  @override
  State<AddDoctorScreen> createState() => _AddDoctorScreenState();
}

class _AddDoctorScreenState extends State<AddDoctorScreen> {
  final _form = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _experience = TextEditingController();
  final _licenseNumber = TextEditingController();
  final _working = TextEditingController();
  File? _photo;
  var type = '';

  @override
  void initState() {
    type = widget.userDetail.type;
    _name.text = widget.userDetail.name;
    _experience.text = widget.userDetail.doctorExperience ?? '';
    _licenseNumber.text = widget.userDetail.licenseNumber ?? '';
    _working.text = widget.userDetail.currentOrPreviousWorkPlace ?? '';
    super.initState();
  }

  @override
  void dispose() {
    _name.dispose();
    _experience.dispose();
    _licenseNumber.dispose();
    _working.dispose();
    super.dispose();
  }

  Future<void> _changePhoto() async {
    final fileResult = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );
    final file = fileResult?.files.first;
    if (file?.path != null) {
      _photo = File(file!.path!);
      setState(() {});
    }
  }

  void _add() {
    if (_form.currentState != null && _form.currentState!.validate()) {
      if (_photo == null && widget.userDetail.photoUrl == null) {
        Fluttertoast.showToast(msg: 'Enter image of doctor first');
        return;
      }
      context.read<DoctorCubit>().updateDoctor(
            doctor: widget.userDetail.copyWith(
              name: _name.text.trim(),
              doctorExperience: _experience.text.trim(),
              licenseNumber: _experience.text.trim(),
              currentOrPreviousWorkPlace: _working.text.trim(),
            ),
            userPhotoFile: _photo,
            onSuccess: () {
              Fluttertoast.showToast(msg: 'Successfully updated');
              if (widget.popOnSuccess && mounted) {
                Navigator.of(context).pop();
              }
            },
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentUserType =
        getIt<SharedPreferences>().getString(AppKey.userType);
    final readOnly = !widget.showSave && currentUserType != UserType.admin;
    return BlocBuilder<DoctorCubit, DoctorState>(
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                title: const Text('View Doctor Details'),
                actions: widget.showLogout
                    ? [
                        IconButton(
                          icon: const Icon(Icons.logout),
                          onPressed: () {
                            FirebaseAuth.instance.signOut();
                          },
                        ),
                      ]
                    : [],
              ),
              body: Form(
                key: _form,
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    Align(
                      child: AbsorbPointer(
                        absorbing: readOnly,
                        child: InkWell(
                          onTap: _changePhoto,
                          child: Container(
                            height: 300,
                            width: 300,
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .surfaceContainerHigh,
                              image: _photo != null
                                  ? DecorationImage(
                                      image: FileImage(_photo!),
                                      fit: BoxFit.cover,
                                    )
                                  : widget.userDetail.photoUrl != null &&
                                          // ignore: use_if_null_to_convert_nulls_to_bools
                                          widget.userDetail.photoUrl
                                                  ?.trim()
                                                  .isEmpty ==
                                              false
                                      ? DecorationImage(
                                          image: CachedNetworkImageProvider(
                                            widget.userDetail.photoUrl!,
                                          ),
                                          fit: BoxFit.cover,
                                        )
                                      : null,
                            ),
                            child: _photo == null ||
                                    widget.userDetail.photoUrl == null
                                ? null
                                : const Center(child: Icon(Icons.add)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      initialValue: widget.userDetail.email,
                      decoration: const InputDecoration(
                        labelText: "Doctor's Email",
                      ),
                      readOnly: true,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _name,
                      decoration: const InputDecoration(
                        labelText: "Doctor's Name",
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty == true) {
                          return 'Required';
                        }
                        return null;
                      },
                      readOnly: readOnly,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _licenseNumber,
                      decoration: const InputDecoration(
                        labelText: 'License Number',
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty == true) {
                          return 'Required';
                        }
                        return null;
                      },
                      readOnly: readOnly,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _experience,
                      decoration: const InputDecoration(
                        labelText: 'Experience',
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty == true) {
                          return 'Required';
                        }
                        return null;
                      },
                      readOnly: readOnly,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _working,
                      decoration: const InputDecoration(
                        labelText: 'Current / Previous Work Place',
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty == true) {
                          return 'Required';
                        }
                        return null;
                      },
                      readOnly: readOnly,
                    ),
                    const SizedBox(height: 20),
                    if (currentUserType == UserType.admin || widget.showSave)
                      FilledButton(
                        onPressed: _add,
                        child: const Text('Save'),
                      ),
                  ],
                ),
              ),
            ),
            if (state.loading) const FullScreenLoader(),
          ],
        );
      },
    );
  }
}
