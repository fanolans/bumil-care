import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../widgets/articles_carousel_widget.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/card_info_widget.dart';
import '../widgets/main_features_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  String greetingMessages() {
    var hour = DateTime.now().hour;

    if (hour <= 10) {
      return 'Selamat Pagi';
    } else if ((hour > 10) && (hour <= 15)) {
      return 'Selamat Siang';
    } else if ((hour > 15) && (hour < 18)) {
      return 'Selamat Sore';
    } else {
      return 'Selamat Malam';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: const DrawerWidget(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Bumil Care',
        ),
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
                padding: const EdgeInsets.only(top: 100, left: 45),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Material(
                      borderRadius: BorderRadius.circular(30),
                      elevation: 5,
                      child: const CircleAvatar(
                        backgroundImage:
                            AssetImage('${assetImages}profile.jpg'),
                        backgroundColor: Colors.transparent,
                        radius: 30,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          greetingMessages(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'Farrel Nolan Syahdony',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const CardInfoWidget(),
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
                      const MainFeaturesWidget(),
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
                      const ArticlesCarouselWidget(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
