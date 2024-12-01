import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stray_dog_adoption/core/widget/button/app_button.dart';
import 'package:stray_dog_adoption/core/widget/loader/full_screen_loader.dart';
import 'package:stray_dog_adoption/feature/common/presentation/cubit/login/login_cubit.dart';
import 'package:stray_dog_adoption/gen/assets.gen.dart';
import 'package:stray_dog_adoption/main.dart';

@RoutePage()
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    required this.userType,
    super.key,
  });

  final String userType;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _showingPassword = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Login button action
  Future<void> _register() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    await context.read<LoginCubit>().register(
      widget.userType,
      email,
      password,
      () async {
        await Fluttertoast.showToast(
          msg: 'Please check your email for verification',
        );
        await appRouter.maybePop();
      },
    );
  }

  void _login() {
    appRouter.maybePop();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                title: Text('${widget.userType} Register'),
              ),
              body: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: ListView(
                    children: <Widget>[
                      const SizedBox(height: 32),
                      Align(child: Assets.images.icon.image(width: 128)),
                      const SizedBox(height: 32),
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter your email',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty == true) {
                            return 'Required';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          suffixIcon: IconButton(
                            onPressed: () {
                              _showingPassword = !_showingPassword;
                              setState(() {});
                            },
                            icon: Icon(
                              _showingPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty == true) {
                            return 'Required';
                          }
                          return null;
                        },
                        obscureText: !_showingPassword,
                      ),
                      const SizedBox(height: 32),
                      // Login Button
                      AppButton.primary(
                        onPressed: _register,
                        text: 'Register',
                      ),
                      const SizedBox(height: 32),
                      TextButton(
                        onPressed: _login,
                        child: const Text('Back to login'),
                      ),
                    ],
                  ),
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
