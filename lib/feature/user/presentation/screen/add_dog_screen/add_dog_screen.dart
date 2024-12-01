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
import 'package:stray_dog_adoption/feature/common/data/model/dog/dog.dart';
import 'package:stray_dog_adoption/feature/user/presentation/cubit/dog/dog_cubit.dart';
import 'package:uuid/uuid.dart';

@RoutePage()
class AddDogScreen extends StatefulWidget {
  const AddDogScreen({
    this.dog,
    this.popOnSuccess = true,
    this.showLogout = false,
    this.showSave = false,
    this.selectOrganization = false,
    super.key,
  });
  final Dog? dog;
  final bool popOnSuccess;
  final bool showLogout;
  final bool showSave;
  final bool selectOrganization;

  @override
  State<AddDogScreen> createState() => _AddDogScreenState();
}

class _AddDogScreenState extends State<AddDogScreen> {
  final _form = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _type = TextEditingController();
  final _condition = TextEditingController();
  final _color = TextEditingController();
  final _weight = TextEditingController();
  final _age = TextEditingController();
  final _gender = TextEditingController();
  final _trait = TextEditingController();
  final _location = TextEditingController();
  File? _photo;
  var type = '';

  @override
  void initState() {
    if (widget.dog != null) {
      _type.text = widget.dog?.type ?? '';
      _name.text = widget.dog?.name ?? '';
      _condition.text = widget.dog?.condition ?? '';
      _color.text = widget.dog?.color ?? '';
      _weight.text = widget.dog?.weight?.toStringAsFixed(2) ?? '';
      _age.text = widget.dog?.age?.toString() ?? '';
      _gender.text = widget.dog?.gender?.toString() ?? '';
      _trait.text = widget.dog?.trait?.toString() ?? '';
      _location.text = widget.dog?.location?.toString() ?? '';
    }
    super.initState();
  }

  @override
  void dispose() {
    _name.dispose();
    _type.dispose();
    _condition.dispose();
    _color.dispose();
    _weight.dispose();
    _age.dispose();
    _gender.dispose();
    _trait.dispose();
    _location.dispose();
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
      if (_photo == null && widget.dog?.photoUrl == null) {
        Fluttertoast.showToast(msg: 'Enter image of dog first');
        return;
      }
      Dog? dog;
      if (widget.dog != null) {
        dog = widget.dog?.copyWith(
          age: _age.text.trim(),
          color: _color.text.trim(),
          condition: _condition.text.trim(),
          gender: _gender.text.trim(),
          location: _location.text.trim(),
          name: _name.text.trim(),
          trait: _trait.text.trim(),
          type: _type.text.trim(),
          weight: double.tryParse(_weight.text.trim()),
        );
      } else {
        dog = Dog(
          dogId: const Uuid().v4(),
          age: _age.text.trim(),
          color: _color.text.trim(),
          condition: _condition.text.trim(),
          gender: _gender.text.trim(),
          location: _location.text.trim(),
          name: _name.text.trim(),
          trait: _trait.text.trim(),
          type: _type.text.trim(),
          weight: double.tryParse(_weight.text.trim()),
          organizationEmail: FirebaseAuth.instance.currentUser?.email ?? '',
          uid: FirebaseAuth.instance.currentUser?.uid,
        );
      }
      context.read<DogCubit>().upsert(
            dog: dog!,
            userPhotoFile: _photo,
            dogId: dog.dogId,
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
    final readOnly = !widget.showSave &&
        currentUserType != UserType.admin &&
        currentUserType != UserType.organization;
    return BlocBuilder<DogCubit, DogState>(
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                title: const Text('View Dog Detail'),
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
                                  : widget.dog?.photoUrl != null &&
                                          // ignore: use_if_null_to_convert_nulls_to_bools
                                          widget.dog?.photoUrl
                                                  ?.trim()
                                                  .isEmpty ==
                                              false
                                      ? DecorationImage(
                                          image: CachedNetworkImageProvider(
                                            widget.dog!.photoUrl!,
                                          ),
                                          fit: BoxFit.cover,
                                        )
                                      : null,
                            ),
                            child:
                                _photo == null || widget.dog?.photoUrl == null
                                    ? null
                                    : const Center(child: Icon(Icons.add)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _name,
                      decoration: const InputDecoration(
                        labelText: 'Name',
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
                      controller: _type,
                      decoration: const InputDecoration(
                        labelText: 'Type',
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
                      controller: _condition,
                      decoration: const InputDecoration(
                        labelText: 'Condition',
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
                      controller: _color,
                      decoration: const InputDecoration(
                        labelText: 'Color',
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
                      controller: _weight,
                      decoration: const InputDecoration(
                        labelText: 'Weight',
                      ),
                      keyboardType: TextInputType.number,
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
                      controller: _age,
                      decoration: const InputDecoration(
                        labelText: 'Age',
                      ),
                      keyboardType: TextInputType.number,
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
                      controller: _gender,
                      decoration: const InputDecoration(
                        labelText: 'Gender',
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
                      controller: _trait,
                      decoration: const InputDecoration(
                        labelText: 'Trait',
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
                      controller: _location,
                      decoration: const InputDecoration(
                        labelText: 'Location',
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
                    if (currentUserType == UserType.admin ||
                        currentUserType == UserType.organization ||
                        widget.showSave)
                      FilledButton(
                        onPressed: _add,
                        child: const Text('Save'),
                      ),
                    SizedBox(height: MediaQuery.paddingOf(context).bottom),
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
