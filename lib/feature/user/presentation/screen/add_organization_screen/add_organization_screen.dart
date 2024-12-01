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
import 'package:stray_dog_adoption/feature/user/presentation/cubit/organization/organization_cubit.dart';

@RoutePage()
class AddOrganizationScreen extends StatefulWidget {
  const AddOrganizationScreen({
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
  State<AddOrganizationScreen> createState() => _AddOrganizationScreenState();
}

class _AddOrganizationScreenState extends State<AddOrganizationScreen> {
  final _form = GlobalKey<FormState>();
  final _name = TextEditingController();
  File? _photo;
  var type = '';

  @override
  void initState() {
    type = widget.userDetail.type;
    _name.text = widget.userDetail.name;
    super.initState();
  }

  @override
  void dispose() {
    _name.dispose();
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
        Fluttertoast.showToast(msg: 'Enter image of organization first');
        return;
      }
      context.read<OrganizationCubit>().updateOrganization(
            organization: widget.userDetail.copyWith(
              name: _name.text.trim(),
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
    return BlocBuilder<OrganizationCubit, OrganizationState>(
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                title: const Text('Add Organization'),
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
                            width: 300,
                            height: 300,
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
                        labelText: "Organization's Email",
                      ),
                      readOnly: true,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _name,
                      decoration: const InputDecoration(
                        labelText: "Organization's Name",
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
