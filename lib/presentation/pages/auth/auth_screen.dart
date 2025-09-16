import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thekettu/presentation/pages/auth/bloc/auth_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

import 'bloc/auth_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return Center(
            child: ElevatedButton(
              onPressed: () async {
                  context.read<AuthCubit>().login(
                    success: () {

                    },
                  );
              },
              child: const Text("Login"),
            ),
          );
        },
      ),
    );
  }
}
