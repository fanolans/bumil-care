import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quiz/cubit/auth/auth_cubit.dart';
import 'package:flutter_quiz/data/datasources/firebase_database_datasource.dart';
import 'package:flutter_quiz/data/local/shared_preferences_data.dart';
import 'package:flutter_quiz/data/models/quiz.dart';
import 'package:flutter_quiz/ui/pages/login/login_ui.dart';
import 'package:flutter_quiz/ui/pages/monitoring/monitoring_ui.dart';
import 'package:flutter_quiz/ui/pages/profile/profile_ui.dart';
import 'package:flutter_quiz/ui/pages/quiz/quiz_type_one_ui.dart';
import 'package:flutter_quiz/ui/pages/quiz/quiz_type_two_ui.dart';
import 'package:flutter_quiz/ui/pages/quiz/quiz_ui.dart';
import 'package:flutter_quiz/ui/pages/result/result_ui.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

import '../../../common/constant/assets_constant.dart';
import '../../../common/constant/string_constant.dart';
import '../../../data/models/account.dart';
import '../education/component/caousel.dart';
import '../education/education_ui.dart';
import 'components/home_ui_consultation_button.dart';
import 'components/home_ui_drawer.dart';
import 'components/home_ui_screening_button.dart';
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
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: const HomeDrawer(),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu_rounded,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 2.4,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('${assetImages}home-background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 90, 20, 0),
                child: Column(
                  children: [
                    HomeUserProfileCard(
                      name: user.displayName ?? 'User',
                      imagePath: user.photoURL ?? 'https://i.pravatar.cc/300',
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 55,
                    ),
                    HomeTopButton(
                      name: isLoading ? 'Loading...' : resikoValue,
                      onPressed: () {
                        if (resikoValue == 'Belum ada hasil') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.green,
                              content: Text(
                                  'Belum ada hasil, silahkan skrining dulu'),
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
                  ],
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Icon(
                        Icons.drag_handle_rounded,
                        color: Colors.grey.shade600,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          HomeScreeningButton(
                            name: StringConstant.homeStartQuiz,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const QuizUi();
                                  },
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          HomeConsultationButton(
                            name: StringConstant.homeStartQuiz,
                            onPressed: () async {
                              if (!await checkEligbleTakeQuiz()) {
                                // ignore: use_build_context_synchronously
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text(
                                        'Lengkapi dulu data pribadi anda di halaman profil'),
                                  ),
                                );
                                return;
                              } else {
                                // ignore: use_build_context_synchronously
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const MonitoringPage();
                                    },
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20, top: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Edukasi Preeklamsi',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text('Data')
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
    // return ScaffoldGradientBackground(
    //   drawer: const HomeDrawer(),
    //   extendBody: true,
    //   gradient: LinearGradient(
    //     begin: Alignment.topLeft,
    //     end: Alignment.bottomRight,
    //     stops: const [0.0, 1.0],
    //     colors: [
    //       Colors.red.shade300,
    //       Colors.red.shade100,
    //     ],
    //   ),
    //   appBar: AppBar(
    //     leading: Builder(
    //       builder: (BuildContext context) {
    //         return IconButton(
    //           icon: const Icon(
    //             Icons.menu_rounded,
    //             color: Colors.white,
    //             size: 30,
    //           ),
    //           onPressed: () {
    //             Scaffold.of(context).openDrawer();
    //           },
    //           tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
    //         );
    //       },
    //     ),
    //     backgroundColor: Colors.transparent,
    //     centerTitle: true,
    //     title: const Text(
    //       'Bumil Care',
    //       style: TextStyle(
    //         color: Colors.white,
    //         fontWeight: FontWeight.bold,
    //         fontSize: 20,
    //       ),
    //     ),
    //   ),
    //   body: SingleChildScrollView(
    //     scrollDirection: Axis.vertical,
    //     child: Column(
    //       children: [
    //         Padding(
    //           padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
    //           child: Column(
    //             children: [
    //               HomeUserProfileCard(
    //                 name: user.displayName ?? 'User',
    //                 imagePath: user.photoURL ?? 'https://i.pravatar.cc/300',
    //               ),
    //               SizedBox(
    //                 height: MediaQuery.of(context).size.height / 55,
    //               ),
    //               HomeTopButton(
    //                 name: isLoading ? 'Loading...' : resikoValue,
    //                 onPressed: () {
    //                   if (resikoValue == 'Belum ada hasil') {
    //                     ScaffoldMessenger.of(context).showSnackBar(
    //                       const SnackBar(
    //                         backgroundColor: Colors.green,
    //                         content:
    //                             Text('Belum ada hasil, silahkan skrining dulu'),
    //                       ),
    //                     );
    //                   } else {
    //                     Navigator.push(
    //                       context,
    //                       MaterialPageRoute(
    //                         builder: (context) {
    //                           return const ResultPage();
    //                         },
    //                       ),
    //                     );
    //                   }
    //                 },
    //               ),
    //             ],
    //           ),
    //         ),
    //         Container(
    //           width: double.infinity,
    //           height: MediaQuery.of(context).size.height / 1.6,
    //           decoration: const BoxDecoration(
    //             color: Colors.white,
    //             borderRadius: BorderRadius.only(
    //               topRight: Radius.circular(30),
    //               topLeft: Radius.circular(30),
    //             ),
    //           ),
    //           child: Column(
    //             children: [
    //               const SizedBox(
    //                 height: 5,
    //               ),
    //               Icon(
    //                 Icons.drag_handle_rounded,
    //                 color: Colors.grey.shade600,
    //               ),
    //               const SizedBox(
    //                 height: 5,
    //               ),
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   HomeScreeningButton(
    //                     name: StringConstant.homeStartQuiz,
    //                     onPressed: () {
    //                       Navigator.push(
    //                         context,
    //                         MaterialPageRoute(
    //                           builder: (context) {
    //                             return const QuizUi();
    //                           },
    //                         ),
    //                       );
    //                     },
    //                   ),
    //                   const SizedBox(
    //                     width: 16,
    //                   ),
    //                   HomeConsultationButton(
    //                     name: StringConstant.homeStartQuiz,
    //                     onPressed: () async {
    //                       if (!await checkEligbleTakeQuiz()) {
    //                         ScaffoldMessenger.of(context).showSnackBar(
    //                           const SnackBar(
    //                             backgroundColor: Colors.red,
    //                             content: Text(
    //                                 'Lengkapi dulu data pribadi anda di halaman profil'),
    //                           ),
    //                         );
    //                         return;
    //                       } else {
    //                         Navigator.push(
    //                           context,
    //                           MaterialPageRoute(
    //                             builder: (context) {
    //                               return const QuizUi();
    //                             },
    //                           ),
    //                         );
    //                       }
    //                     },
    //                   ),
    //                 ],
    //               ),
    //               SizedBox(
    //                 height: MediaQuery.of(context).size.height / 25,
    //               ),
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
