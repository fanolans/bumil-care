import 'package:flutter_quiz/common/constant/string_constant.dart';

class ResultEntities {
  final String title;
  final String content;
  final bool initiallyExpanded;

  ResultEntities({
    required this.title,
    required this.content,
    required this.initiallyExpanded,
  });
}

final List<ResultEntities> resultEntities = [
  ResultEntities(
    title: 'Obesitas',
    content: StringConstant.resultTileContent,
    initiallyExpanded: true,
  ),
  ResultEntities(
    title: 'IMT',
    content: StringConstant.resultTileContent,
    initiallyExpanded: false,
  ),
  ResultEntities(
    title: 'Hipertensi',
    content: StringConstant.resultTileContent,
    initiallyExpanded: false,
  ),
  ResultEntities(
    title: 'Diabetes',
    content: StringConstant.resultTileContent,
    initiallyExpanded: false,
  ),
];
