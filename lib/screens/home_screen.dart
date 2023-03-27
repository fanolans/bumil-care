import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../widgets/drawer_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        flexibleSpace: const Image(
          image: AssetImage('${assetImages}appBar-background.jpg'),
          fit: BoxFit.cover,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Farrel Nolan Syahdony',
          style: TextStyle(fontSize: 14),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.45,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('${assetImages}home-background.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.height * 0.20,
                      height: MediaQuery.of(context).size.height * 0.07,
                      decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                      ),
                      child: const Text('asasa'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 100),
                      child: Column(
                        children: const [
                          Text('asasa'),
                          Text('asasa'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Card(
                elevation: 10,
                color: Colors.white,
                child: Text('a'),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Card(
                    elevation: 10,
                    color: Colors.white,
                    child: Text('a'),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Card(
                    elevation: 10,
                    color: Colors.white,
                    child: Text('a'),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
