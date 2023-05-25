import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quiz/cubit/auth/auth_cubit.dart';
import 'package:flutter_quiz/cubit/education/education_cubit.dart';
import 'package:flutter_quiz/cubit/quiz/quiz_cubit.dart';
import 'package:flutter_quiz/cubit/quiz_answer/quiz_answer_cubit.dart';

import 'package:flutter_quiz/data/datasources/firebase_auth_datasource.dart';
import 'package:flutter_quiz/data/datasources/firebase_database_datasource.dart';

import '../../cubit/account/account_cubit.dart';
import '../../cubit/faq/monitoring_cubit.dart';

class AppProviders extends StatelessWidget {
  const AppProviders({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (_) => AuthCubit(
            FirebaseAuthDatasource(),
          ),
        ),
        BlocProvider(
          create: (_) => AccountCubit(
            FirebaseDatabaseDatasource(),
          ),
        ),
        BlocProvider(
          create: (_) => QuizCubit(
            FirebaseDatabaseDatasource(),
          ),
        ),
        BlocProvider(
          create: (_) => QuizAnswerCubit(
            FirebaseDatabaseDatasource(),
          ),
        ),
        BlocProvider(
          create: (_) => EducationCubit()..getEducations(),
        ),
        BlocProvider(
          create: (_) => FaqCubit()..getFaq(),
        )
      ],
      child: child,
    );
  }
}
