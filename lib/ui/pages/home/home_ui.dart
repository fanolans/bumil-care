import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quiz/cubit/auth/auth_cubit.dart';
import 'package:flutter_quiz/data/datasources/firebase_database_datasource.dart';
import 'package:flutter_quiz/data/local/shared_preferences_data.dart';
import 'package:flutter_quiz/data/models/quiz.dart';
import 'package:flutter_quiz/ui/pages/login/login_ui.dart';
import 'package:flutter_quiz/ui/pages/profile/profile_ui.dart';
import 'package:flutter_quiz/ui/pages/quiz/quiz_type_one_ui.dart';
import 'package:flutter_quiz/ui/pages/quiz/quiz_type_two_ui.dart';
import 'package:flutter_quiz/ui/pages/quiz/quiz_ui.dart';
import 'package:flutter_quiz/ui/pages/result/result_ui.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

import '../../../common/constant/string_constant.dart';
import '../../../data/models/account.dart';
import 'components/home_ui_bottom_button.dart';
import 'components/home_ui_profile_card.dart';
import 'components/home_ui_top_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String resikoValue = '';
  bool isLoading = false;
  @override
  void initState() {
    isLoading = true;
    SharedPreferencesData.getResiko().then((resiko) {
      setState(() {
        resikoValue = resiko;
        isLoading = false;
      });
    });
    addAccount();
    super.initState();
  }

  Future<bool> checkEligbleTakeQuiz() async {
    final user = FirebaseAuth.instance.currentUser!;
    final account = await FirebaseDatabaseDatasource().getAccount(user.uid);
    if (account.age == '' || account.height == '' || account.weight == '') {
      return false;
    }
    return true;
  }

  void addAccount() async {
    final user = FirebaseAuth.instance.currentUser!;
    final myAccount = Account(
      id: user.uid,
      photoURL: user.photoURL!,
      email: user.email!,
      name: user.displayName!,
      birthDate: '',
      age: '',
      height: '',
      weight: '',
    );
    if (!await FirebaseDatabaseDatasource().getExistingUser(user.uid)) {
      FirebaseDatabaseDatasource().addAccount(
        user.uid,
        myAccount.toMap(),
      );
      SharedPreferencesData.saveAccount(myAccount);
    } else {
      final account = await FirebaseDatabaseDatasource().getAccount(user.uid);
      SharedPreferencesData.saveAccount(account);
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return ScaffoldGradientBackground(
      extendBody: true,
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: const [0.0, 1.0],
        colors: [
          Colors.red.shade300,
          Colors.red.shade100,
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Bumil Care',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const ProfilePage();
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.account_circle,
              color: Colors.white,
              size: 32,
            ),
          ),
          IconButton(
            onPressed: () {
              context.read<AuthCubit>().signOut();

              // Temporary solution
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
                (route) => false,
              );
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
              size: 32,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            HomeUserProfileCard(
              name: user.displayName ?? 'User',
              imagePath: user.photoURL ?? 'https://i.pravatar.cc/300',
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 24,
            ),
            HomeTopButton(
              name: isLoading ? 'Loading...' : resikoValue,
              onPressed: () {
                if (resikoValue == 'Belum ada hasil') {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.green,
                      content: Text('Belum ada hasil, silahkan skrining dulu'),
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const ResultPage();
                      },
                    ),
                  );
                }
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 15,
            ),
            HomeBottomButton(
              name: StringConstant.homeStartQuiz,
              onPressed: () async {
                if (!await checkEligbleTakeQuiz()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(
                          'Lengkapi dulu data pribadi anda di halaman profil'),
                    ),
                  );
                  return;
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const QuizUi();
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
