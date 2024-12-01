import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stray_dog_adoption/core/router/app_router.gr.dart';
import 'package:stray_dog_adoption/core/widget/button/app_button.dart';
import 'package:stray_dog_adoption/core/widget/loader/full_screen_loader.dart';
import 'package:stray_dog_adoption/data/constant/user_type.dart';
import 'package:stray_dog_adoption/feature/common/presentation/cubit/login/login_cubit.dart';
import 'package:stray_dog_adoption/gen/assets.gen.dart';
import 'package:stray_dog_adoption/main.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({
    required this.userType,
    super.key,
  });

  final String userType;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
  Future<void> _login() async {
    if (_formKey.currentState != null &&
        _formKey.currentState!.validate() == true) {
      final email = _emailController.text;
      final password = _passwordController.text;
      await context.read<LoginCubit>().login(widget.userType, email, password);
    }
  }

  void _register() {
    appRouter.push(RegisterRoute(userType: widget.userType));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                title: Text('${widget.userType} Login'),
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
                        onPressed: _login,
                        text: 'Login',
                      ),
                      const SizedBox(height: 32),
                      if (widget.userType != UserType.admin)
                        TextButton(
                          onPressed: _register,
                          child: const Text('Create new account'),
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
