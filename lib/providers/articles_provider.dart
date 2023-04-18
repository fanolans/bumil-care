import 'package:bumil_care/models/article_model.dart';
import 'package:flutter/material.dart';

import '../api/article_api.dart';

class NotesProvider with ChangeNotifier {
  final List<Articles> _articles = [
    Articles(
      id: 'N1',
      title: 'Preeklamsi 1',
      article: 'Preeklamsi 1',
    ),
    Articles(
      id: 'N2',
      title: 'Preeklamsi 2',
      article: 'Preeklamsi 2',
    ),
    Articles(
      id: 'N3',
      title: 'Preeklamsi 3',
      article: 'Preeklamsi 3',
    ),
    Articles(
      id: 'N4',
      title: 'Preeklamsi 4',
      article: 'Preeklamsi 4',
    ),
  ];

  List<Articles> get articles {
    ArticleApi().getAllArticle();

    return _articles;
  }

  Articles getArticle(String? id) {
    return _articles.firstWhere((article) => article.id == id);
  }
}
