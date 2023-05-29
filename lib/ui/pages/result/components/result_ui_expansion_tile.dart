import 'package:flutter/material.dart';

class ResultExpansionTile extends StatelessWidget {
  const ResultExpansionTile({
    super.key,
    required this.title,
    required this.content,
    this.initiallyExpanded,
  });

  final String title;
  final List<String> content;
  final bool? initiallyExpanded;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      child: ExpansionTile(
        initiallyExpanded: initiallyExpanded ?? false,
        collapsedIconColor: Colors.red.shade200,
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        controlAffinity: ListTileControlAffinity.trailing,
        childrenPadding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        children: [
          const ListTile(
            title: Text(
              'Sebaiknya anda menerapkan pola gaya hidup sehat berikut:',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                height: 1.2,
              ),
            ),
          ),
          ...content.asMap().entries.map(
                (e) => ListTile(
                  minLeadingWidth: 10,
                  leading: Text(
                    '${e.key + 1}.',
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  title: Text(
                    e.value,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      height: 1.2,
                    ),
                  ),
                ),
              ),
        ],
      ),
    );
  }
}
