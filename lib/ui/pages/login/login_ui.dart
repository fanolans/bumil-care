import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quiz/cubit/auth/auth_cubit.dart';
import 'package:flutter_quiz/data/datasources/firebase_database_datasource.dart';
import 'package:flutter_quiz/data/models/account.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

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
    return ScaffoldGradientBackground(
      extendBody: true,
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: const [0.0, 1.0],
        colors: [
          Colors.blue.shade800,
          Colors.blue.shade500,
        ],
      ),
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
                Center(
                  child: Text(
                    StringConstant.firstLine,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 13,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 85,
                ),
                Center(
                  child: Text(
                    StringConstant.secondLine,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 8,
                      color: Colors.white,
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
