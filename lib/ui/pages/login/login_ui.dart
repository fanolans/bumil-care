import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quiz/cubit/auth/auth_cubit.dart';

import '../../../common/constant/assets_constant.dart';
import '../../../common/constant/string_constant.dart';
import '../home/home_ui.dart';
import 'components/login_ui_google_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          state.when(
            initial: () {},
            loading: () {},
            success: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
            error: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.red,
                  content: Text('Login Google Error'),
                ),
              );
            },
          );
        },
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            state.maybeMap(
              orElse: () {},
              loading: (value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            );
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Image.asset('${assetIcons}app-icon.png'),
                ),
                Center(
                  child: Text(
                    StringConstant.secondLine,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 8,
                      color: Colors.red.shade200,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: LoginGoogleButton(
        onPressed: () {
          context.read<AuthCubit>().signInWithGoogle();
        },
      ),
    );
  }
}
