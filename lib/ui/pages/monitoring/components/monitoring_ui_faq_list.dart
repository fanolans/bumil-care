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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: ExpansionTile(
          collapsedIconColor: Colors.red.shade200,
          title: Text(
            faq.question,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          children: [
            ListTile(
              title: Text(
                faq.answer,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
