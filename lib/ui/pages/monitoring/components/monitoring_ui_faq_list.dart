import 'package:flutter/material.dart';

import '../../../../data/models/faq.dart';

class FaqList extends StatelessWidget {
  const FaqList({
    Key? key,
    required this.faq,
  }) : super(key: key);
  final Faq faq;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        child: InkWell(
          onTap: () {},
          child: Column(
            children: [
              Text(
                faq.question,
                maxLines: 2,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                faq.answer,
                maxLines: 2,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
