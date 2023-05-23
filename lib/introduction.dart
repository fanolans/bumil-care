import 'package:flutter/material.dart';
import 'package:flutter_quiz/ui/pages/login/login_ui.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'common/constant/assets_constant.dart';

int introduction = 0;

Future initIntroduction() async {
  final prefs = await SharedPreferences.getInstance();
  int? intro = prefs.getInt('introduction');
  if (intro != null && intro == 1) {
    return introduction = 1;
  }
  prefs.setInt('introduction', 1);
}

class Introduction extends StatefulWidget {
  const Introduction({super.key});

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  Widget _buildImage(String assetName) {
    return Image.asset(
      '$assetImages$assetName',
      fit: BoxFit.cover,
    );
  }

  @override
  Widget build(BuildContext context) {
    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
      bodyAlignment: Alignment.center,
      bodyTextStyle: TextStyle(fontSize: 14),
      imageAlignment: Alignment.bottomCenter,
      imagePadding: EdgeInsets.zero,
      pageColor: Colors.white,
    );
    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
          title: 'Skrining',
          body:
              'Lakukan skrining preeklamsi untuk mencegah komplikasi pada kehamilan!',
          image: _buildImage('intro-1.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: 'Konsultasi',
          body:
              'Tanyakan semua keluhanmu seputar kesehatan dan kita carikan solusinya',
          image: _buildImage('intro-2.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: 'Edukasi',
          body: 'Perluas pengetahuanmu tentang kesehatan dan gaya hidup sehat!',
          image: _buildImage('intro-3.png'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        );
      },
      showSkipButton: true,
      showNextButton: true,
      showDoneButton: true,
      skip: const Text(
        'Skip',
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      next: const Icon(Icons.arrow_forward),
      done: const Text(
        'Mulai',
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25.0),
          ),
        ),
      ),
    );
  }
}
